class_name NPC
extends StaticBody2D

@onready var sprite: Sprite2D = $sprite
@onready var interactable_component: Area2D = $Interactable_Component

@export var npc_data : Character
@export var dialgoue_Res : DialogueResource
@export var dialogue_start = "start"



func _ready() -> void:
	if npc_data:
		sprite.texture = npc_data.sprite
		%Name.text = npc_data.npc_name
		
		
		interactable_component.action_entered.connect(_on_interactable_component_action_entered)
		interactable_component.action_existed.connect(_on_interactable_component_action_existed)
		interactable_component.interacted.connect(_on_interactable_component_interacted)



func _on_interactable_component_action_entered(_area) -> void:
	
	interactable_component.label_text = "Press E to talk to " + npc_data.npc_name
	%Name.show()


func _on_interactable_component_action_existed(_area) -> void:
	interactable_component.label_text = ""
	%Name.hide()


func _on_interactable_component_interacted() -> void:
	
	if Npc_Handler.can_talk_with_npc == "true":
		if dialgoue_Res:
			DialogueManager.show_dialogue_balloon(dialgoue_Res,dialogue_start)
