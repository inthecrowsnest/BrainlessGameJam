extends UITweener

@onready var textHolder = $Control/MainTextBox
@onready var scroll = $Control/MainTextBox/ScrollContainer
@onready var textbox = %RichTextLabel
@onready var scrollbar = scroll.get_v_scroll_bar()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
func add_text_line(text : String, type_delay, first: bool, end: bool):
	if first:
		textbox.add_text("> ")
	for c in text:
		await get_tree().create_timer(type_delay).timeout
		textbox.add_text(c)
		scroll.scroll_vertical = scrollbar.max_value
	if end:
		textbox.add_text('\n')
	scroll.scroll_vertical = scrollbar.max_value
	
func add_text_chunk(text_list: Array):
	for line in text_list:
		var s = line[0]
		var delay = line[1]
		var first = line[2]
		var end = line[3]
		
		await add_text_line(s, delay, first, end)
	
	
