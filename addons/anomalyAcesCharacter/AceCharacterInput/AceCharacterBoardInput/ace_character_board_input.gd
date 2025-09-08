@tool
class_name AceCharacterBoardInput extends AceCharacterInput


func process_character_input(delta:float):
	## This follows the assigned path
	if character.curr_path_target != Vector3.INF:
		var move_stats: AceMoveStats = character.calculate_move_stats(character.curr_path_target, delta)
		character.velocity = move_stats.velocity
		
		if is_zero_approx(move_stats.distance):
			character._find_next_point_in_path()
		else:
			character.move_and_slide()
	else:
		# If the current target has not been set yet listen for a new target
		if character.curr_path_target == Vector3.INF && character.enableInput:
			var input_dir := input_map.get_input_vector()

			character._normalize_position()
			
			if !character.hasDiagonalMovement:
				# stop diagonal movement by listening for left/right input then setting y axis to zero
				if Input.is_action_pressed(input_map.east_input) || Input.is_action_pressed(input_map.west_input):
					input_dir.y = 0
					var target: Vector3 = character.position + Vector3(input_dir.x,0,input_dir.y)
					if BoardGeneratorGridUtil.isLocationDefinedSpace(target, character.gridMap, character.spaceEditor):
						character.add_target_to_path(target)
				# stop diagonal movement by listening for  up/down input then setting x axis to zero
				elif Input.is_action_pressed(input_map.north_input) || Input.is_action_pressed(input_map.south_input):
					input_dir.x = 0
					var target: Vector3 = character.position + Vector3(input_dir.x,0,input_dir.y)
					if BoardGeneratorGridUtil.isLocationDefinedSpace(target, character.gridMap, character.spaceEditor):
						character.add_target_to_path(target)
				else:
					input_dir = Vector2.ZERO
			else:
				var target: Vector3 = character.position + Vector3(input_dir.x,0,input_dir.y)
				if BoardGeneratorGridUtil.isLocationDefinedSpace(target, character.gridMap, character.spaceEditor):
					character.add_target_to_path(target)
