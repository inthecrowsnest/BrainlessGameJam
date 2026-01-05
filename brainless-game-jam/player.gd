extends CharacterBody2D

#movement taken from godot intro to 2d tutorial
# https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html

# shooting taken from this kidscancode.org godot recipe webpage
# https://kidscancode.org/godot_recipes/4.x/2d/2d_shooting/index.html

@onready var bullet_timer = %BulletDelay

@export var speed = 400
@export var rotation_speed = 1.5
@export var bullet : PackedScene
@export var fire_delay : float = 0.2

var rotation_direction = 0
var is_shooting = false 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		is_shooting = true
	elif event.is_action_released("shoot"):
		is_shooting = false

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	if is_shooting and bullet_timer.is_stopped():
		bullet_timer.start(fire_delay)
		shoot()
	
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = %BulletSpawnPoint.global_transform
