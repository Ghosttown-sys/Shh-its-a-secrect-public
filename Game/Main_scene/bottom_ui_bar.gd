extends MarginContainer

@onready var new_day: Button = %New_day
@onready var roll_dice: Button = %Roll_Dice


func _ready() -> void:
	roll_dice.hide()
	Events.dice_roll_ui_on.connect(dice_roll_ui_on)
	Events.new_day_ui_on.connect(new_day_ui_on)

func dice_roll_ui_on()->void:
	roll_dice.show()
	new_day.hide()
	
func new_day_ui_on()->void:
	
	roll_dice.hide()
	new_day.show()
	

func _on_roll_dice_pressed() -> void:
	Events.dice_roll_requested.emit()
	roll_dice.hide()
	new_day.hide()


func _on_new_day_pressed() -> void:
	Events.start_new_day_ui.emit()
	roll_dice.hide()
	new_day.hide()
