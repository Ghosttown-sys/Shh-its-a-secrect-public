extends Node

#region Signals
signal npc_changed
signal npc_talking
signal player_talking
#endregion

#region Constants
const CHARACTERS = {
	"BAKER": {
		"resource_path": "res://Global/Resources/Characters/Baker.tres",
		"alive": true
	},
	"BLACK_SMITH": {
		"resource_path": "res://Global/Resources/Characters/Black_Smith.tres",
		"alive": true
	},
	"ELDER": {
		"resource_path": "res://Global/Resources/Characters/Elder.tres",
		"alive": true
	},
	"FARMER": {
		"resource_path": "res://Global/Resources/Characters/Farmer.tres",
		"alive": true
	},
	"GARDNER_1": {
		"resource_path": "res://Global/Resources/Characters/Gardner_1.tres",
		"alive": true
	},
	"GARDNER_2": {
		"resource_path": "res://Global/Resources/Characters/Gardner_2.tres",
		"alive": true
	},
	"GARDNER_3": {
		"resource_path": "res://Global/Resources/Characters/Gardner_3.tres",
		"alive": true
	},
	"TAILOR": {
		"resource_path": "res://Global/Resources/Characters/Tailor.tres",
		"alive": true
	},
	"FOXY": {
		"resource_path": "res://Global/Resources/Characters/cime_scene.tres",
		"alive": false
	},
	"TRIPLETS": {
		"resource_path": "res://Global/Resources/Characters/Triplets.tres",
		"alive": false
	},
}
const CRIME_SCENE_RESOURCE_PATH = "res://Global/Resources/Characters/cime_scene.tres"
#endregion

#region Variables

var characters_state = {}
var current_npc = null
var can_talk_with_npc := "true"

#endregion

#region Lifecycle

func _ready() -> void:
	characters_state = CHARACTERS.duplicate(true)

#endregion

#region NPC Management

func set_current_npc(npc_name: String) -> void:
	var key = npc_name.to_upper()
	if characters_state.has(key):
		current_npc = key
		emit_signal("npc_changed")
		print("Current NPC set to:", key)
	else:
		print("Error: NPC", npc_name, "does not exist.")

func get_current_npc() -> Resource:
	if current_npc and characters_state.has(current_npc):
		return load(characters_state[current_npc]["resource_path"])
	else:
		print("Error: No valid current NPC is set.")
		return null

func get_npc(npc_name: String) -> Character:
	var key = npc_name.to_upper()
	if characters_state.has(key) and characters_state[key]["alive"]:
		return load(characters_state[key]["resource_path"])
	else:
		print("Error: Invalid or dead NPC name used in `get_npc(npc_name: String) -> Resource` call.")
		return null

func get_npcs() -> Dictionary:
	var ret_val := Dictionary()
	for npc_key in characters_state.keys():
		if characters_state[npc_key]["alive"]:
			ret_val[npc_key] = characters_state[npc_key]
	return ret_val

func kill_npc(npc_name: String) -> void:
	var key = npc_name.to_upper()
	if characters_state.has(key) and characters_state[key]["alive"]:
		characters_state[key]["alive"] = false
		characters_state[key]["resource_path"] = CRIME_SCENE_RESOURCE_PATH
		print(key, "has been killed.")
	else:
		print("Error: Cannot kill NPC", npc_name, ". NPC does not exist or is already dead.")

#endregion

#region Player and NPC Interaction

func detective_active() -> void:
	emit_signal("player_talking")

func npc_active() -> void:
	emit_signal("npc_talking")

#endregion
