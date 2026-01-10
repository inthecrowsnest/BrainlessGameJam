# enemy_spawner.gd
extends Node



func spawn_enemies(data, spawnLocation):
	var enemy_instance = Global.enemy_dictionaries[0].file
	enemy_instance.setup_enemy_data(data)
	spawnLocation.add_child(enemy_instance)
