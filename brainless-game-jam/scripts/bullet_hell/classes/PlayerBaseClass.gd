extends CharacterBody2D
class_name Player

# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
var bullet_file = preload("res://scenes/bullet.tscn")
@onready var health = Global.player_health
@onready var shoot_sfx: AudioStreamPlayer = %shoot_sfx
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var hurt_sfx: AudioStreamPlayer = %hurt_sfx

signal player_death
signal player_shoot
signal hurted
# ---------------------

func _ready() -> void:
	player_shoot.connect(on_shoot)
	hurted.connect(on_hurt)
	shoot_sfx.volume_db = Global.volume
	hurt_sfx.volume_db = Global.volume
	
func spawn_bullet(data, spawn):
	var bullet_data = data
	var spawnedBullet = bullet_file.instantiate()
	spawnedBullet.setup_bullet_data(bullet_data)
	spawnedBullet.transform = spawn.global_transform  # Get parent global position to spawn bullet there
	spawnedBullet.scale = Vector2(0.2, 0.2) # bullets spawning super big?? for no reason??
	spawnedBullet.bullet_owner = 'player'
	spawnedBullet.speed = spawnedBullet.speed * 2.0
	spawnedBullet.damage = spawnedBullet.damage * 2.0
	spawnedBullet.add_to_group("bullets")
	get_parent().add_child(spawnedBullet)
	player_shoot.emit()
	
func hurt(damage):
	health -= damage
	hurted.emit()
	if health <= 0:
		self.queue_free()
		self.emit_signal("player_death")
	
func on_shoot():
	shoot_sfx.play()
	
func on_hurt():
	hurt_sfx.play()
	sprite_2d.modulate = "#1d2800"
	await get_tree().create_timer(0.2).timeout
	sprite_2d.modulate = "#ffffff"
