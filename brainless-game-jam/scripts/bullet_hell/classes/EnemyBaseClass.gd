# Base class for all enemy instances
extends CharacterBody2D
class_name Enemy

@export var EnemyDataFile : EnemyData 
@export var radius = 0.1
var health = 100.0

signal enemy_death

## DEMO ---------------------------
#var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
#var enemy_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_enemy.tres")
#var bullet_file = preload("res://scenes/bullet.tscn")
## ---------------------
# This function is called when instancing an Enemy scene (probably by a gameManager).
# The parameter data refers to a resource object (.tres) which we will assign to the variable EnemyData
# In this way we can generate different type of enemies depending on their resource sheets
func setup_enemy_data(data):
	print(data)
	var load_data = load(data)
	EnemyDataFile = load_data 


# this function will take the amount of bullets the character will spawn and set a marker group up 
# equadistant from each other. since they will be nodes, they will rotate with the enemy,
# which will allow for directional shooting
func setup_bullet_spawns(bullets_per_shot, marker_group, enemy):
	print(enemy, enemy.position, radius)
	var rad_vector = enemy.position * radius
	for i in bullets_per_shot:
		var marker = Marker2D.new()	
		marker_group.add_child(marker)
		marker.position = rad_vector
		marker.rotation = rad_vector.angle()
		rad_vector = rad_vector.rotated(2*PI/bullets_per_shot)

# will spawn a bullet for every marker in the enemies marker group (made from
# setup_bullet_spawns)
func spawn_bullet(marker_group):
	for marker in marker_group.get_children():
		var spawnedBullet = Global.bullet_file.instantiate()
		get_parent().add_child(spawnedBullet)
		spawnedBullet.transform = marker.global_transform
		spawnedBullet.bullet_owner = 'enemies'
		spawnedBullet.add_to_group("bullets")
		
	
func hurt(damage):
	health -= damage
	print(health)
	
	if health <= 0:
		emit_signal("enemy_death")
		self.queue_free()
	
	
	
	
	
	
