extends Player

#movement taken from godot intro to 2d tutorial
# https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html

# shooting taken from this kidscancode.org godot recipe webpage
# https://kidscancode.org/godot_recipes/4.x/2d/2d_shooting/index.html

@onready var bullet_timer = %BulletDelay

@onready var speed = Global.player_speed
@onready var rotation_speed = Global.player_rotation
@onready var fire_delay = Global.player_fire_delay

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
		spawn_bullet(bullet_test_data, %BulletSpawnPoint)
	#
#func shoot():
	#var b = bullet.instantiate()
	#owner.add_child(b)
	#b.transform = %BulletSpawnPoint.global_transform
