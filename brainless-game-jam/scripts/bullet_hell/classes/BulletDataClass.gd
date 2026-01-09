# BulletDataClass.gd - This allows to create bullets with different stats
# For now, we only have speed and health, but later we could include logic to make bullet patterns
extends Resource
class_name BulletData

@export var bullet_speed : int = 30
@export var bullet_health : int = 0 # This determines the duration of projectiles
@export var bullet_damage : int = 10
@export var direction : int = 60
@export var bullet_duration : int = 30
@export var velocity : Vector2 
@export var bullet_owner: String 


#var speed = 100
#var direction := 60
#var duration = 100
#var velocity : Vector2 = Vector2(1,0)
#var bullet_owner : String
#var damage = 10
