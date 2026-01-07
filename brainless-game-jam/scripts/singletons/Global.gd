# Global.gd 
# This class will be in charge of saving data that could be relevant overall in the project.
extends Node

# –––––––––––––––––– Feel free to modify any data inside here - Jack ——————————
var enemy_dictionary = {
	'type': 'basic',
	'file': preload("res://scenes/enemy.tscn")
}

var level_dictionary = {
	'level-1': preload("res://scenes/bullet_hell_demo.tscn"),
}

# When this variable is false, the game ends
var game_state : bool = true 
# Check if the user is in the dialog phase
var dialog_playing : bool = false


# –––––––––––––––––––––––––——————————————————————————————––––––––––––––––––––––––––––
