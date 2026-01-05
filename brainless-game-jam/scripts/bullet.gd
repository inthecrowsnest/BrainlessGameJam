extends Area2D

# TODO: current bullet only makes contact with enemies. 
# will want to tag enemy/player bullets so player doesnt get hit by own bullets?
# shouldnt need two different bullet scenes for that, but may be quicker if we
# need to spaghetti code it :/

@export var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
#	if touches an enemy, delete the enemy node. 
	if body.is_in_group("Enemies"):
		# TODO: replace with enemy damage function
		body.queue_free()
# remove bullet after making contact with an enemy
# TODO: make a world boundary to delete bullets off screen?
		queue_free()
