# level_loader.gd
# This node will be in every level and will be in charge of loading levels.
extends Node

#temp ----
@export var next_level : PackedScene 
# IDEALLY: next_level = Global.levels[number_of_level] or \
# @onready var level = get_parent().current_level

#temp ----

func _ready() -> void:
	pass
	#load_level(next_level)?

func load_level(level):
	get_tree().change_scene_to_packed(level)

func _on_button_pressed() -> void: # When a specific signal is received, we load the next_level.
	load_level(next_level)
