extends Node2D

@onready var unit: CharacterBody2D = $unit
@onready var camera: Camera2D = $Camera
@onready var dice_handlers: Node2D = $Dice_Handlers


@export var dialgoue_Res : DialogueResource
@export var dialogue_start = "start"



func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialgoue_Res,dialogue_start)
	
	Events.total_dice_rolled.connect(_dice_has_been_rolled)
	Events.dice_roll_requested.connect(_dice_roll_requested)
	
	
	_dice_has_been_rolled(0)


func _dice_roll_requested() ->void:
	camera.reparent(dice_handlers)
	camera.relocate_camera()
	await get_tree().create_timer(0.5).timeout
	Events.roll_dice.emit()

func _dice_has_been_rolled(_number : int) ->void:
	camera.reparent(unit)
	camera.relocate_camera()
	
