# BulletDataClass.gd - This allows to create bullets with different stats
# For now, we only have speed and health, but later we could include logic to make bullet patterns
extends Resource
class_name BulletData

@export var bullet_speed : int = 30
@export var bullet_health : int = 0 # This determines the duration of projectiles
