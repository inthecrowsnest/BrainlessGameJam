extends Enemy


@onready var marker_group := %markerGroup
@onready var timer := %shotTimer
#@onready var shot_delay = Global.enemy_fire_delay

# EnemyDataFile will be assigned when enemy is spawned VIA game_manager script.
# Enemy types are located in the Global enemy script, and the types to spawn are directed
# via the scripting JSON. 

func _ready() -> void:
	setup_bullet_spawns(EnemyDataFile.bullets_per_shot, marker_group, $".")
	timer.start(EnemyDataFile.shot_delay)
	sprite_2d.texture = EnemyDataFile.texture

func _process(delta: float) -> void:
	self.rotation_degrees -= EnemyDataFile.rotation_speed * delta
	

func _on_shot_timer_timeout() -> void:
	spawn_bullet(marker_group)
