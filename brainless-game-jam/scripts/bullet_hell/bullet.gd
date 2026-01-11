extends Bullet

var speed = Global.bullet_speed
var direction := 60
var duration = 100
var bullet_owner : String
var damage = Global.bullet_damage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	duration -= delta
	if duration <= 0:
		queue_free()
	position += transform.x * delta * speed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player') and bullet_owner != 'player':
		#print("You've hit the PLAYER")
		if !body.invinc:
			print("PLAYER TAKEN DAMAGE")
			body.hurt(damage)
#		should signal some sort of player death signal to respawn the player/restart the level
		queue_free()
		
	if body.is_in_group('enemies') and bullet_owner != 'enemies':
		print("You've hit an ENEMY")
		body.hurt(damage)
		queue_free()
		

# since the walls are an area2d
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		if area.bullet_owner != bullet_owner:
			area.queue_free()
			queue_free()
	
	if area.is_in_group("walls"):
		queue_free()
