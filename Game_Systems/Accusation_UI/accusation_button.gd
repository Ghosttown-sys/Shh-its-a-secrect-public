extends TextureButton


var _INNER_OUTLINE = load("res://assets/Materials/inner_outline.tres")

@export var npc_name := ""


func _ready() -> void:
	var texture = Npc_Handler.get_npc(npc_name).sprite
	texture_disabled = texture
	texture_focused = texture
	texture_hover = texture
	texture_normal = texture
	texture_pressed = texture


func _process(delta: float) -> void:
	if is_hovered() and material == null:
		material = _INNER_OUTLINE
	else:
		material = null


func _on_button_up() -> void:
	Events.npc_accused.emit(npc_name)
