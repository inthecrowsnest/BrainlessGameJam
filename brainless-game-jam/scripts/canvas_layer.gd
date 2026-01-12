extends CanvasLayer

@onready var button: Button = %Button
@onready var button_2: Button = %Button2

var scene : PackedScene = preload("res://scenes/game_manager.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("skip_text"):
		Global.skip = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(scene)


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_mouse_entered() -> void:
	button.modulate = "#008e0f"

func _on_button_mouse_exited() -> void:
	button.modulate = "#ffffff"


func _on_button_2_mouse_entered() -> void:
	button_2.modulate = "#008e0f"

func _on_button_2_mouse_exited() -> void:
	button_2.modulate = "#ffffff"


func _on_volume_value_changed(value: float) -> void:
	Global.volume = value

func _on_player_rotation_value_changed(value: float) -> void:
	Global.player_rotation = value
