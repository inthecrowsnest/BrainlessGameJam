# Global.gd 
# This class will be in charge of saving data that could be relevant overall in the project.
extends Node

# –––––––––––––––––– Feel free to modify any data inside here - Jack ——————————
var enemy_dictionaries = [
 {
	'name': "enemy_scene",
	'type': 'scene',
	'file': preload("res://scenes/enemy.tscn") # 
 },
 {
	'name':'static_enemy',
	'type': 'resource',
	'file': null
 }
]

var level_dictionary = {
	'level-1': preload("res://scenes/test_scenes/bullet_hell_demo.tscn"),
}

# When this variable is false, the game ends
var game_state : bool = true 
# Check if the user is in the dialog phase
var dialog_playing : bool = false


# –––––––––––––––––––––––––——————————————————————————————––––––––––––––––––––––––––––
# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
var enemy_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_enemy.tres")
var bullet_file = preload("res://scenes/bullet.tscn")
var enemy_file = preload('res://scenes/enemy.tscn')
# ---------------------
