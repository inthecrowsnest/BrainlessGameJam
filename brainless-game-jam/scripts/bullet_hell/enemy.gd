extends Enemy

@onready var marker_group := %markerGroup
@onready var timer := %shotTimer
@export var rotation_speed := 0.0
@export var shot_delay := 1.0

func _ready() -> void:
	setup_bullet_spawns(EnemyDataFile.bullets_per_shot, marker_group, $".")
	setup_enemy_data(enemy_test_data) # When an enemy is instanced they will assign themselves data (for now)
	timer.start(shot_delay)
	#print(EnemyDataFile.name)
	#print(EnemyDataFile.bullets_per_shot)
	
# In the future, a gameManager will do this instead

func _process(delta: float) -> void:
	self.rotation_degrees -= rotation_speed * delta
	

func _on_shot_timer_timeout() -> void:
	spawn_bullet(bullet_test_data, marker_group)
