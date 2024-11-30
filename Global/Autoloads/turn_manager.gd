extends Node

var move_points : int = 0
var day_number : int = 0
var dice_rolls_left : int = 3

var hours_per_segment : float = 14/3
var time_per_move_point : float = 0.0

var player_data : Player_Data
var is_moving : bool = false

signal time_changed(current_time: float)

func _ready() -> void:
	
	Events.set_player_data.connect(_set_player_data)
	Events.total_dice_rolled.connect(dice_rolled)
	Events.start_new_day_ui.connect(start_new_day)

func _set_player_data(new_data : Player_Data) -> void:
	player_data = new_data

func dice_rolled(roll_result: int):
	move_points += roll_result
	time_per_move_point = hours_per_segment / move_points
	Events.turn_data_changed.emit(move_points, day_number, dice_rolls_left)
	Events.new_turn.emit()



func consume_move_point():
	if move_points > 0:
		move_points -= 1
		Day_Night_Manager.add_time(time_per_move_point)
		if move_points == 0:
			handle_end_of_turn()
	Events.turn_data_changed.emit(move_points, day_number, dice_rolls_left)
	is_moving = false


func handle_end_of_turn():
	dice_rolls_left -= 1
	
	if dice_rolls_left <= 0:
		Events.new_day_ui_on.emit()
	
	else:
		Events.dice_roll_ui_on.emit()

	Events.turn_data_changed.emit(move_points, day_number, dice_rolls_left) 


func start_new_day()->void:
		dice_rolls_left = 3
		day_number += 1
		Day_Night_Manager.start_next_day()
		Events.new_day.emit(day_number)

	
