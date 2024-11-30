class_name ClueBook
extends CanvasLayer


signal clue_learned(data: ClueData)


@onready var center_container: CenterContainer = $CenterContainer
@onready var label: Label = $CenterContainer2/Label

@export var clues : Array[ClueData]


func add_clue(data: ClueData):
	if not clues.has(data):
		clues.append(data)
		label.visible = true
		get_tree().create_timer(0.5).timeout.connect(func(): label.visible = false)
		clue_learned.emit(data)


func get_book_text() -> String:
	var text := ""
	for clue in clues:
		if clue:
			text += clue.clue_text + "\n\n"
	return text


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_clue_book"):
		center_container.visible = not center_container.visible
