extends Enemy

@onready var marker_group := %markerGroup
@onready var timer := %shotTimer
@export var enemy_file : Resource
#@export var rotation_speed := 45.0
@onready var shot_delay = Global.enemy_fire_delay

func _ready() -> void:
	#setup_enemy_data(enemy_file) # When an enemy is instanced they will assign themselves data (for now)
	setup_bullet_spawns(EnemyDataFile.bullets_per_shot, marker_group, $".")
	timer.start(shot_delay)
	#print(EnemyDataFile.name)
	#print(EnemyDataFile.bullets_per_shot)
	
# In the future, a gameManager will do this instead
	
func _process(delta: float) -> void:
	self.rotation_degrees -= EnemyDataFile.rotation_speed * delta
	

func _on_shot_timer_timeout() -> void:
	spawn_bullet(Global.bullet_test_data, marker_group)
