extends CanvasLayer

@onready var ui_bar: MarginContainer = %UI_Bar
@onready var clue_container: MarginContainer = %Clue_Container
@onready var clue_book_button: Button = %Clue_Book_Button
@onready var clue_ui: Control = %Clue_UI
@onready var clues: ScrollContainer = %Clues
@onready var clue_list: VBoxContainer = %Clue_list
@onready var label_steps: Label = %label_steps
@onready var label_day: Label = %label_day
@onready var label_dice: Label = $UI_Bar/VBoxContainer/Ui_Container4/MarginContainer/label_dice

const CLUE_LABEL = preload("res://Game_Systems/CLues/clue_label.tscn")

var is_open := false
var clue_array: Array = []

func _ready() -> void:
	Clues.clue_added.connect(new_clue)
	Events.turn_data_changed.connect(_on_unit_turn_data_changed)

func new_clue(new_clue_details: String) -> void:
	if new_clue_details in clue_array:
		return
	
	clue_array.append(new_clue_details)
	
	var clue_label = CLUE_LABEL.instantiate()
	clue_label.text = new_clue_details

	rescale_clue_container_to_max()
	clue_list.add_child(clue_label)

func _on_clue_book_button_pressed() -> void:
	if !is_open:
		rescale_clue_container_to_max()

func rescale_clue_container_to_max() -> void:
	var tween = get_tree().create_tween()
	ui_bar.hide()
	clue_container.show()
	tween.tween_property(clue_container, "size", Vector2(2000, 2500), 1)
	await tween.finished
	is_open = true

func rescale_clue_container_to_min() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(clue_container, "size", Vector2(250, 250), 1)
	await tween.finished
	clue_container.hide()
	ui_bar.show()
	is_open = false

func _on_close_pressed() -> void:
	if is_open:
		rescale_clue_container_to_min()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_clue_book"):
		if is_open:
			rescale_clue_container_to_min()
		else:
			rescale_clue_container_to_max()

func _on_unit_turn_data_changed(move_points: int, day_number: int, dice_rolls_left: int) -> void:
	label_steps.text = str(move_points)
	label_dice.text = str(dice_rolls_left)
	label_day.text = str(day_number)
