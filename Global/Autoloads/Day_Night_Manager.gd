extends Node

const EVENING_HOUR : float = 18.0
const MORNING_HOUR : float = 8.0

signal game_time(time: float)
signal new_day

var initial_day : int = 1
var initial_hour : float = 2.5

var current_day: int = 0
var time : float:
	set(new_value):
		time = wrapf(new_value, 0.0, 24.0)
		game_time.emit(time)


func _ready() -> void:
	set_initial_time()


func set_initial_time() -> void:
	current_day = initial_day
	time = initial_hour


func start_night() -> void:
	time = EVENING_HOUR


func start_next_day() -> void:
	time = MORNING_HOUR


func add_time(time_to_add: float) -> void:
	time += time_to_add
