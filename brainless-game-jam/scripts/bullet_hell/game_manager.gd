# gameManager.gd
extends Node

@onready var boundary_box: Node2D = %BoundaryBox


func _ready() -> void:
	get_enemy_data(1)

func get_enemy_data(i):
	var enemy_type = Global.enemy_dictionaries[i].name
	print(enemy_type)
	for enemy in boundary_box.get_child(0).get_child(3).get_children():
		print(enemy)
		var spawned_enemy = Global.enemy_file.instantiate()
		spawned_enemy.setup_enemy_data(Global.enemy_test_data)
		get_parent().add_child.call_deferred(spawned_enemy)
		spawned_enemy.transform = enemy.global_transform
		#spawned_enemy.bullet_owner = 'enemies'
