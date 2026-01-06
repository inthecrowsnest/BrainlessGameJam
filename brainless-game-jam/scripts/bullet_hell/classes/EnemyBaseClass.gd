# Base class for all enemy instances
extends Node2D
class_name Enemy

@export var EnemyDataFile : EnemyData 

# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
var enemy_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_enemy.tres")
var bullet_file = preload("res://scenes/bullet.tscn")
# ---------------------
# This function is called when instancing an Enemy scene (probably by a gameManager).
# The parameter data refers to a resource object (.tres) which we will assign to the variable EnemyData
# In this way we can generate different type of enemies depending on their resource sheets
func setup_enemy_data(data):
	EnemyDataFile = data 

func spawn_bullet(data, i ):
	var bullet_data = data
	var spawnedBullet = bullet_file.instantiate()
	spawnedBullet.setup_bullet_data(bullet_data)
	get_parent().get_node("Enemy").add_child(spawnedBullet)
	spawnedBullet.global_position = global_position
	
	
	
	
	
	
	
