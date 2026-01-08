extends Node2D
class_name UITweener

func scale(object, x, y, duration):
	var tween = create_tween()
	tween.tween_property(object, "scale", Vector2(x, y), duration)
	
func move(object, x, y, duration):
	var tween = create_tween()
	tween.tween_property(object, "position", Vector2(x, y), duration)
	
func move_and_scale(object, scale_x, scale_y, pos_x, pos_y, duration):
	var tween = create_tween()
	tween.parallel().tween_property(object, "scale", Vector2(scale_x, scale_y), duration)
	tween.parallel().tween_property(object, "position", Vector2(pos_x, pos_y), duration)
	
func size(object, x, y, duration):
	var tween = create_tween()
	tween.tween_property(object, "size", Vector2(x, y), duration)
	
