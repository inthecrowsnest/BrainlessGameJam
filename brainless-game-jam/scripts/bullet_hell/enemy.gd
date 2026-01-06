extends Enemy



func _ready() -> void:
	setup_enemy_data(enemy_test_data) # When an enemy is instanced they will assign themselves data (for now)
	
# In the future, a gameManager will do this instead


func _process(delta: float) -> void:
	spawn_bullet(bullet_test_data)
	self.rotate(0.1) 
