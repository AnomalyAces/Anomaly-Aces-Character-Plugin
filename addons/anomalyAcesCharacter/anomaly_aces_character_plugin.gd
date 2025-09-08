@tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	#Add Custom Types
	add_custom_type(
		"AceCharacter3D",
		"CharacterBody3D",
		preload("res://addons/anomalyAcesCharacter/AceCharacter3D/ace_character_3d.gd"),
		preload("res://addons/anomalyAcesCharacter/AceCharacter.svg")
	)

	print("AceCharacter3D Entering Tree")


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("AceCharacter3D")
