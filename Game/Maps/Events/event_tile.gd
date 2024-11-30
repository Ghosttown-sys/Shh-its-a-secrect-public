class_name EventTile
extends Node2D

#region variables
@onready var question_mark: Sprite2D = $QuestionMark

@export var event_resource : PackedScene:
	set(new_value):
		event_resource = new_value
		if npc:
			npc.queue_free()
		npc = event_resource.instantiate()
		add_child(npc)

var npc : Node
#endregion


func trigger_event() -> void:
	question_mark.hide()
	print("event triggered")


func _ready() -> void:
	pass
