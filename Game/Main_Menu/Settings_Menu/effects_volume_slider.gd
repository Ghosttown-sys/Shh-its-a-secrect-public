extends HSlider


func _ready() -> void:
	value = Settings_Manager.get_volume(2)


func _on_value_changed(_value: float) -> void:
	Settings_Manager.set_volume(2, value)
