# gameManager.gd
extends Node

@onready var boundary_box: Node2D = %BoundaryBox
@onready var main_text: Node2D = %TextBox
@onready var player = preload("res://scenes/player.tscn")
var dialogue_script : Dictionary
var current_wave : int;
var current_wave_name : String;
var walls;
var skip = false;
var boss;
var double_boss; # will spawn on top of the boss in final stage
var boss_unbeaten : bool = true
signal wave_complete
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var blip_sound = %blip

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("main_menu"):
		get_tree().call_group("bullets", "queue_free")
		get_tree().call_group("player", "queue_free")
		get_tree().call_group("enemies", "queue_free")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
			
	if event.is_action_pressed("skip_text"):
		skip = true

func _ready() -> void:
	audio_stream_player.volume_db = Global.volume
	blip_sound.volume_db = Global.volume
	walls = boundary_box.find_child("Walls")
	boundary_box.visible = false
	var data = "res://json/scripting.json"
	var text = FileAccess.get_file_as_string(data) 
	dialogue_script = JSON.parse_string(text)
	
	await main_text.add_text_chunk(dialogue_script["intro_demo"])
	
	if !skip:
		await main_text.add_text_chunk(dialogue_script["spawn_box_demo"])
	#
	await spawn_player()
#
	if !skip:
		await main_text.add_text_chunk(dialogue_script["spawn_en_demo"])
	#
	await walls.scale(boundary_box, 2.5, 2.5, 2.0)
#
	await spawn_wave("wave1_demo") 
	#spawn_wave("wave1_subspawn")
	
	audio_stream_player.play()
	#
	await on_wave_complete()
	#
	if !skip:
		await main_text.add_text_chunk(dialogue_script["pre_wave_demo"])
	#
	await walls.scale(boundary_box, 3, 4.0, 2.0)
	
	await spawn_wave("wave2_demo")
	
	await on_wave_complete()
	#
	if !skip: 
		await main_text.add_text_chunk(dialogue_script["pre_wave_demo2"])
	#
	await main_text.size(main_text.textHolder, 450, 486.0, 2.0)
	await walls.move_and_scale(boundary_box, 5.0, 4.0,
		boundary_box.global_position.x - 130, boundary_box.global_position.y, 2.0)
	
	
	await spawn_wave("wave3_demo")
	#
	await on_wave_complete()
	
#	boss size
	await main_text.add_text_chunk(dialogue_script["boss_dialog"])
	await walls.move_and_scale(boundary_box, 10.5, 4.5, 
	boundary_box.global_position.x - 250, boundary_box.global_position.y + 10, 2.0)
	main_text.queue_free()
	
	await spawn_boss(false)
	
	while boss.health >= 500: 
		await get_tree().create_timer(5).timeout
		switch_boss_state()
		
	boss_unbeaten = false
	switch_boss_state()
	boss.health = 1000.0
	
	await get_tree().create_timer(15).timeout
	boss.process_mode = boss.PROCESS_MODE_DISABLED # disable boss
	double_boss.process_mode = boss.PROCESS_MODE_DISABLED # disable doubled boss
	
	
func spawn_wave(wave_name: String):
	current_wave_name = wave_name
	var enemy_list = dialogue_script[wave_name]
	var enemy_type = enemy_list[0]
	var spawn_location = enemy_list[1]
	var enemy_num = enemy_list[2]
	
	spawn_enemy_data(enemy_type, spawn_location, enemy_num)
	
func spawn_player():
	#var resp_time = get_tree().create_timer(3)
	#if resp_time.timeout:
	boundary_box.visible = true
	var spawned_player = player.instantiate()
	spawned_player.transform = walls.find_child("player_spawn").global_transform
	spawned_player.scale = Vector2(0.2, 0.2)
	spawned_player.connect("player_death", on_player_death)
	get_tree().current_scene.add_child.call_deferred(spawned_player)

func spawn_boss(final: bool):
	current_wave_name = "boss"
	var topmid = walls.find_child("EnemySpawnGroup").find_child("TopMid")
	var s_boss = Global.enemy_file.instantiate()
#	if spawn boss in "final", spawn a duplicate of the boss and put it right on top of it 
	if final:
		s_boss.setup_enemy_data(Global.boss_states[3])
		s_boss.find_child("Sprite2D").visible = false
		double_boss = s_boss
	else:
		s_boss.setup_enemy_data(Global.boss_states[0])
		boss = s_boss 
	s_boss.transform = topmid.global_transform
	print(topmid.global_transform)
	s_boss.scale = Vector2(0.4, 0.4)
	s_boss.health = 1000.0
	s_boss.add_to_group('boss')
	get_parent().add_child.call_deferred(s_boss)
	
func switch_boss_state():
	var swap_boss = boss
	var data
	if boss_unbeaten:
		var state = randi_range(0, 2)
		print("switching to state =", state)
		data = Global.boss_states[state]
		#boss._ready()
	else: 
		print("final round")
		data = Global.boss_states[3]
		spawn_boss(true)
		#boss._ready()
	swap_boss.setup_enemy_data(data)
	swap_boss.position = swap_boss.EnemyDataFile.position 
	print(swap_boss.position)
	
func spawn_enemy_data(i, spawn_group, num_of_enemies):
	var enemy_type = Global.enemy_dictionaries[i].file
	current_wave = num_of_enemies
	print(enemy_type)
	for marker in walls.find_child("EnemySpawnGroup").get_children():
		if marker.name in spawn_group:
			var spawned_enemy = Global.enemy_file.instantiate()
			spawned_enemy.setup_enemy_data(enemy_type)
			spawned_enemy.transform = marker.global_transform
			spawned_enemy.scale = Vector2(0.2, 0.2)
			spawned_enemy.connect("enemy_death", on_enemy_death)
			get_parent().add_child.call_deferred(spawned_enemy)
			
func on_enemy_death():
	current_wave -= 1
	if current_wave <= 0:
		emit_signal("wave_complete")
		
func on_player_death():
#	respawn player
	spawn_player()

#	clear all bullets to prevent spawn damage
	if current_wave_name != "boss":
		get_tree().call_group("bullets", "queue_free")
		get_tree().call_group("enemies", "queue_free")
		main_text.add_text_chunk(dialogue_script["death"])
		spawn_wave(current_wave_name)
	
		
func on_wave_complete():
	await wave_complete
#	clear all bullets on screen after wave clear
	get_tree().call_group("bullets", "queue_free")
