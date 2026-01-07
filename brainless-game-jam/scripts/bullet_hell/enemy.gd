extends Enemy

@onready var marker_group : Node2D = %markerGroup
@export var rotation_speed := 0

func _ready() -> void:
	setup_bullet_spawns(EnemyDataFile.bullets_per_shot, marker_group, $".")
	#setup_enemy_data(enemy_test_data) # When an enemy is instanced they will assign themselves data (for now)
	print(EnemyDataFile.name)
	print(EnemyDataFile.bullets_per_shot)
#	will spawn 10 bullets with a 1 sec delay inbetween
	for i in range(10):
		await get_tree().create_timer(1).timeout
		spawn_bullet(bullet_test_data, marker_group)
	setup_enemy_data(enemy_test_data) # When an enemy is instanced they will assign themselves data (for now)
	
# In the future, a gameManager will do this instead

func _process(delta: float) -> void:
	self.rotation_degrees -= rotation_speed * delta


func fire_circle():
	for i in EnemyDataFile.bullets_per_shot:
		var spawnedBullet = bullet_file.instantiate()
		get_parent().add_child(spawnedBullet)
		spawnedBullet.global_position = global_position
		var angle = TAU * i / EnemyDataFile.bullets_per_shot
		spawnedBullet.velocity = Vector2.RIGHT.rotated(angle) * spawnedBullet.speed
