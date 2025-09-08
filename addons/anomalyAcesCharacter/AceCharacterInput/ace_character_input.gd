@tool
@icon("res://addons/anomalyAcesCharacter/AceCharacterInput/AceCharacterInput.svg")
class_name AceCharacterInput extends Node

@export var character: AceCharacter3D: 
	set(p_character):
		character = p_character
		update_configuration_warnings()
@export var input_map: AceInputMap :
	set(p_input_map):
		input_map = p_input_map
		update_configuration_warnings()

func process_character_input(delta:float):
	pass


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray

	#Check Input 
	if character == null:
		warnings.append("A node of type AceCharacter3D is needed")

	#Check Input 
	if input_map == null:
		warnings.append("A node of type AceInputMap is needed")

	return warnings