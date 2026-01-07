extends Bullet

var speed = 100
var direction := 60
var duration = 10
var velocity : Vector2 = Vector2(1,0)
var bullet_owner : String
var damage = 10

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#print('A bullet entered scene')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	duration -= delta
	if duration <= 0:
		queue_free()
	position += transform.x * delta * speed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player') and bullet_owner != 'player':
		print("You've hit the PLAYER")
		body.hurt(damage)
#		should signal some sort of player death signal to respawn the player/restart the level
		queue_free()
		
	if body.is_in_group('enemies') and bullet_owner != 'enemies':
		print("You've hit an ENEMY")
		body.hurt(damage)
		queue_free()
