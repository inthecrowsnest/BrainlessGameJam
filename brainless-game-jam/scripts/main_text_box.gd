extends UITweener

@onready var textHolder = $Control/MainTextBox
@onready var scroll = $Control/MainTextBox/ScrollContainer
@onready var textbox = %RichTextLabel
@onready var scrollbar = scroll.get_v_scroll_bar()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await add_text_frag("Do you want to", 0.1, true)
	await add_text_frag(" play ", 0.5, false)
	await add_text_line("my game :)", 0.1, false)
	await get_tree().create_timer(1).timeout
	await add_text_line("Here let me grow you :)", 0.1, true)
	
	scale(get_parent().find_child("BoundaryBox"), 2, 2, 5.0)
	
#	should never be scaling the textHolder y axis, once it is too small we will queue free and 
# alter text in the top bar :3
	await size(textHolder, 200, textHolder.size.y, 2.0)
	move(get_parent().find_child("BoundaryBox"), 600, 300, 2.0)
	
	for i in range(25):
		await get_tree().create_timer(1).timeout
		await add_text_line("DONT LEAVE ME", 0.01, true)
		
func add_text_line(text : String, type_delay, first: bool):
	if first:
		textbox.add_text("> ")
	scroll.scroll_vertical = scrollbar.max_value
	for c in text:
		await get_tree().create_timer(type_delay).timeout
		textbox.add_text(c)
	textbox.add_text('\n')
	
func add_text_frag(text : String, type_delay, first: bool):
	if first:
		textbox.add_text("> ")
	scroll.scroll_vertical = scrollbar.max_value
	for c in text:
		await get_tree().create_timer(type_delay).timeout
		textbox.add_text(c)
	
	
	
