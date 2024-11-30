class_name Day_night_modulator
extends CanvasModulate

#region variables
@export_range(0,1) var gradient_time : float:
	set(new_value):
		color = day_night_gradiant.gradient.sample(new_value)
		gradient_time = new_value
		%DayNightWheel.rotation_degrees = (new_value * -180.0) - 90.0

@export var day_night_gradiant : GradientTexture1D
#endregion


func _ready() -> void:
	Day_Night_Manager.game_time.connect(_on_game_time)
	Day_Night_Manager.set_initial_time()


func _on_game_time(time: float):
	var sample_value = time / 24
	
	$DayNightUI/TimeLabel.text = str(time)
	
	var tween = get_tree().create_tween()
	tween.tween_property(
		self, 
		"gradient_time", 
		sample_value, 
		0.8
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
