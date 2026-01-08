extends UITweener

@onready var textHolder = $Control/MainTextBox
@onready var textbox = %RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(1)
	await get_tree().create_timer(1).timeout
	textbox.add_text("Haiiii\n")
	print(1)
	await get_tree().create_timer(1).timeout
	textbox.add_text("Do you want to play my game :)\n")
	print(1)
	await get_tree().create_timer(1).timeout
	textbox.add_text("Baiiii\n")
	
#	should never be scaling the textHolder y axis, once it is too small we will queue free and 
# alter text in the top bar :3
	size(textHolder, 200, textHolder.size.y, 2.0)
