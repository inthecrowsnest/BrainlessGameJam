extends CanvasLayer

#@export (String, FILE, "*.json") var scene_text_file
var scene_text_file

var scene_text = {}
var selected_text = []
var in_progress = false

@onready var background = %Background
@onready var text_label = %TextLabel

func _ready() -> void:
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.connect("display_dialog", on_display_dialog)
	
# tutorial outdated 
func load_scene_text():
	if FileAccess.file_exists(scene_text_file):
		var file = FileAccess.open(scene_text_file, FileAccess.READ)
		var content = file.get_as_text()
		print(content)
		
func on_display_dialog():
	pass
