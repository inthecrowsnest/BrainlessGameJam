extends CharacterBody2D
class_name Player

# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
var bullet_file = preload("res://scenes/bullet.tscn")
@onready var health = Global.player_health

signal player_death

# ---------------------

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
	
func hurt(damage):
	health -= damage
	
	if health <= 0:
		self.queue_free()
		self.emit_signal("player_death")
	
