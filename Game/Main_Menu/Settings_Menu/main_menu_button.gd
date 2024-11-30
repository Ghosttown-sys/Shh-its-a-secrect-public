extends Button


@onready var node: CanvasLayer = $"../.."


func _on_button_up() -> void:
	node.queue_free()
