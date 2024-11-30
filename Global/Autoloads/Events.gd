extends Node

signal dice_roll_requested
signal total_dice_rolled(number:int)
signal roll_dice

signal new_turn

signal new_day(day_number: int)

signal set_player_data(player_data: Player_Data)

signal turn_data_changed(move_points: int, day_number: int, dice_rolls_left: int)

#ui trigger signals
signal dice_roll_ui_on
signal new_day_ui_on
signal time_changed(time:float)
signal start_new_day_ui

signal npc_accusation_requested
signal npc_accused(npc_name: String)
