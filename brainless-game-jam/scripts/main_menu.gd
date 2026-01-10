extends CanvasLayer
#
#@onready var p_rotation = %PlayerRotation
#@onready var b_speed = %BulletSpeed
#@onready var b_damage = %BulletDamage


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_manager.tscn")

func _on_bullet_damage_value_changed(value: float) -> void:
	Global.bullet_damage = value


func _on_bullet_speed_value_changed(value: float) -> void:
	Global.bullet_speed = value


func _on_player_rotation_value_changed(value: float) -> void:
	Global.player_rotation = value

func _on_enemy_fire_delay_value_changed(value: float) -> void:
	Global.enemy_fire_delay = value

func _on_player_fire_delay_value_changed(value: float) -> void:
	Global.player_fire_delay = value


func _on_player_speed_value_changed(value: float) -> void:
	Global.player_speed = value


func _on_player_health_value_changed(value: float) -> void:
	Global.player_health = value

func _on_enemy_health_value_changed(value: float) -> void:
	Global.enemy_health = value
