extends Panel

onready var parent = get_parent()

func _on_Button_pressed():
	get_tree().change_scene(parent.next_scene)
