extends ItemContainer

func hit():
	if not opened:
		$LidSprite.hide()
		for i in range(5):
			var pos = $SpawnItems.get_children().pick_random().global_position
			open.emit(pos, current_position)
		opened = true	
