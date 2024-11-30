extends Node

#region Variables
var selected_unit : int = -1
var unit_id_counter := 0
var units : Dictionary
#endregion

#region Unit Management Functions
func generate_id() -> int:
	unit_id_counter += 1
	return unit_id_counter

func _set_selected_unit(id: int):
	if selected_unit != -1:
		units[selected_unit].unit.is_selected = false
		#units[selected_unit].unit.texture.material = null
		selected_unit = -1
	
	if id != -1:
		selected_unit = id
		units[selected_unit].unit.is_selected = true
		#units[selected_unit].unit.texture.material = units[selected_unit].unit.outline_shader
#endregion

#region Initialization
func _setup(preload_units : Array):
	for unit in preload_units:
		unit.unit_id = generate_id()
		units[unit.unit_id] = { "pos": unit.unit_v2i, "unit": unit }
#endregion
