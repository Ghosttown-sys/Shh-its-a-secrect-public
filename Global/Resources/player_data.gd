class_name Player_Data
extends Resource

enum Current_State {
	IDLE,
	WALK
}

@export_category("State_Machine")
@export var current_state : Current_State = Current_State.IDLE


@export var direction : Vector2 = Vector2.UP
@export var can_move := true
@export var velocity :Vector2
