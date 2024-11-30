extends Button


@onready var node: CanvasLayer = $"../.."


func _on_button_up() -> void:
	Settings_Manager.save_settings()
	node.queue_free()
