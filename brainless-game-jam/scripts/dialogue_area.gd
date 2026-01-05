extends Area2D

# used to access proper dialogue from the json file
@export var dialogue_key : String = ""
var area_active : bool = false

# FOLLOWING THE TUTORIAL, SETTING UP DIALOGUE TO TRIGGER WHEN USER
# PRESSES SPACE WHILE IN A DIALOGUE BOX.
# in post, will likely make this an area-entered event / on room clear / death, etc
func _input(event) -> void:
	if area_active and event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialog", dialogue_key)

# when player enters dialogue area, change area active to true
# may have issues with enemies potentially triggering dialogue, but can 
# enforce this by making the player be on a specific layer
# or just.. not add dialogue interaction boxes to enemies LOL
func _on_area_entered(_area: Area2D) -> void:
	area_active = true

func _on_area_exited(_area: Area2D) -> void:
	area_active = false
