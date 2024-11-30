extends Node

#region Signals
signal clue_added
#endregion

#region Constants
const CLUES = {
	"FOXY'S DEATH": {
		"details": "Foxy is dead",
		"resolved": false
	},
}
#endregion

#region Lifecycle
var clue_state = {}

func _ready() -> void:
	clue_state = CLUES.duplicate(true)
#endregion

#region Clue Trigger System

var current_clue = null

func add_clue(clue: String) -> void:
	clue_added.emit(clue) 
	#var key = clue_name.to_upper()
	#
	#if clue_state.has(key):
		#current_clue = key
		#
		#clue_added.emit(get_current_clue())  # Emit the clue details
		#
		#print("Current Clue set to:", key)
	#else:
		#print("Error: CLUE", clue_name, "does not exist.")

func get_current_clue() -> String:
	if current_clue and clue_state.has(current_clue):
		var clue = clue_state[current_clue]
		clue["resolved"] = true 
		return clue["details"] 
		
	else:
		print("Error: No valid current CLUE is set.")
		return ""
#endregion
