@tool
class_name AceCharacterFreeInput extends AceCharacterInput


func process_character_input(delta:float):

	if character.enableInput:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir : Vector2 = input_map.get_input_vector()
		var direction : Vector3 = (character.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			character.velocity.x = direction.x * character.speed
			character.velocity.z = direction.z * character.speed
		else:
			character.velocity.x = move_toward(character.velocity.x, 0, character.speed)
			character.velocity.z = move_toward(character.velocity.z, 0, character.speed)
		
		character.move_and_slide()


