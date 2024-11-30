extends ColorRect

func _ready() -> void:
	Events.start_new_day_ui.connect(new_day)

func create_tween_property(property_path: String, end_value: float, duration: float) -> Tween:
	var tween = get_tree().create_tween()
	tween.tween_property(
		material,
		property_path,
		end_value,
		duration
	)
	return tween

func new_day():
	var tween = create_tween_property("shader_parameter/progress", 1, 0.6)
	await tween.finished
	tween.stop()
	
	var tween_2 = create_tween_property("shader_parameter/progress", 0, 0.6)
	await tween_2.finished
	tween.stop()
	
	Events.dice_roll_requested.emit()
