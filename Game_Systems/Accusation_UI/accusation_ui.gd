extends CanvasLayer


const ACCUSATION_BUTTON = preload("res://Game_Systems/Accusation_UI/accusation_button.tscn")

@onready var h_box_container: HBoxContainer = $HBoxContainer


func _ready() -> void:
	Events.npc_accusation_requested.connect(start_accusation)
	Events.npc_accused.connect(func(npc_name: String): queue_free())
	start_accusation()


func start_accusation():
	var npcs := Npc_Handler.get_npcs()
	for npc in npcs.keys():
		var button = ACCUSATION_BUTTON.instantiate()
		button.npc_name = npc
		h_box_container.add_child(button)
