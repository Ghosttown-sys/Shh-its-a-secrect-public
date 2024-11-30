extends Label


@onready var clue_book: ClueBook = $"../.."


func _process(_delta: float) -> void:
	text = clue_book.get_book_text()
