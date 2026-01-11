# EnemyData.gd - Resource to fill basic enemy information/stats
extends Resource
class_name EnemyData

# This will contain interchangeable data to make different enemies
@export var id : String
@export var bullets_per_shot := 1
@export var rotation_speed := 0.0
@export var shot_delay := 1.0
