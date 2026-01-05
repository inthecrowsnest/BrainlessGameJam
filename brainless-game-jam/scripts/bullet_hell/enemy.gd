extends Enemy



func _ready() -> void:
	#setup_enemy_data(enemy_test_data) # When an enemy is instanced they will assign themselves data (for now)
	print(EnemyDataFile.name)
	print(EnemyDataFile.bullets_per_shot)
	for i in range(10):
		await get_tree().create_timer(1).timeout
		fire_circle()
# In the future, a gameManager will do this instead




func fire_circle():
	for i in EnemyDataFile.bullets_per_shot:
		var spawnedBullet = bullet_file.instantiate()
		get_parent().add_child(spawnedBullet)
		spawnedBullet.global_position = global_position
		var angle = TAU * i / EnemyDataFile.bullets_per_shot
		spawnedBullet.velocity = Vector2.RIGHT.rotated(angle) * spawnedBullet.speed
