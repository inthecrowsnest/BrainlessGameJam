# EnemyData.gd - Resource to fill basic enemy information/stats
extends Resource
class_name EnemyData

# This will contain interchangeable data to make different enemies
@export var id : String
@export var name : String
@export var health : int = 100
@export var speed : float = 30.0
@export var texture : Texture # We can switch enemy sprites with this
@export var bullets_per_shot := 1

# We can attach a script to this variable to create various enemy types with different behaviours: 
@export var enemy_mechanics : Resource 
