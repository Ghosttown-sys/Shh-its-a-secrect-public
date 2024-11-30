extends HSlider


func _ready() -> void:
	value = Settings_Manager.get_volume(1)


func _on_value_changed(_value: float) -> void:
	Settings_Manager.set_volume(1, _value)
