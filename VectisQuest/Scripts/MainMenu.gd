extends Panel

func _on_Button_pressed():
	$StartGame.play()
	get_tree().change_scene("res://Scenes/Worlds/Area1.tscn")
