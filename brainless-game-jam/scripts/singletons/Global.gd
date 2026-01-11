# Global.gd 
# This class will be in charge of saving data that could be relevant overall in the project.
extends Node

var player_rotation = 3.0
var bullet_speed = 450.0
var bullet_damage = 10
var player_speed = 800
var player_fire_delay = 0.2
var enemy_fire_delay = 1
var player_health = 100
var enemy_health = 100

# –––––––––––––––––– Feel free to modify any data inside here - Jack ——————————
var enemy_dictionaries = [
 {
	'name': "4 bullet / 45 rotate",
	'type': 'resource',
	'file': "res://scripts/bullet_hell/bullet_resources/4_45_1.0.tres" 
 },
 {
	'name':'2 bullet / 45 rotate / 0.5 shot delay',
	'type': 'resource',
	'file': "res://scripts/bullet_hell/bullet_resources/2_45_0.5.tres"
 }
]

var boss_states = [
	"res://scripts/bullet_hell/bullet_resources/boss_state1.tres",
	"res://scripts/bullet_hell/bullet_resources/boss_state2.tres",
	"res://scripts/bullet_hell/bullet_resources/boss_state3.tres",
	"res://scripts/bullet_hell/bullet_resources/boss_stateFINAL.tres",
	"res://scripts/bullet_hell/bullet_resources/boss_stateDEFEAT.tres"
]

# When this variable is false, the game ends
var game_state : bool = true 
# Check if the user is in the dialog phase
var dialog_playing : bool = false


# –––––––––––––––––––––––––——————————————————————————————––––––––––––––––––––––––––––
# DEMO ---------------------------
var bullet_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_bullet.tres")
#var enemy_test_data = preload("res://scripts/bullet_hell/bullet_resources/test_enemy.tres")
var bullet_file = preload("res://scenes/bullet.tscn")
var enemy_file = preload('res://scenes/enemy.tscn')
# ---------------------
