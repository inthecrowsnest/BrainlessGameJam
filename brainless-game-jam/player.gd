extends CharacterBody2D

# BASIC MOVEMENT SCRIPT FOR TESTING DIALOGUE BOX - plans to replace with state machine
# straight ripped from the godot tutorial docs lol bc i was too lazy to find my old code to reuse
# https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
