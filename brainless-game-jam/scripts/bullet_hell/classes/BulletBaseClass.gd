# BulletBaseClass.gd 
extends Area2D
class_name Bullet

@export var BulletDataFile : BulletData

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#print('A bullet entered scene')

func setup_bullet_data(data):
	BulletDataFile = data 
