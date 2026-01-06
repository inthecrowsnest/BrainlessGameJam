extends CharacterBody2D
class_name Player

# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
var bullet_file = preload("res://scenes/bullet.tscn")

# ---------------------

func spawn_bullet(data, spawn):
	var bullet_data = data
	var spawnedBullet = bullet_file.instantiate()
	spawnedBullet.setup_bullet_data(bullet_data)
	spawnedBullet.velocity = Vector2(spawnedBullet.speed, 0).rotated(deg_to_rad(spawnedBullet.direction))
	spawnedBullet.global_position = spawn.global_position  # Get parent global position to spawn bullet there
	get_parent().add_child(spawnedBullet)
