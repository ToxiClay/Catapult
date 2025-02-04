extends WindowDialog


signal response_yes
signal response_no


onready var _label = $Panel/Margin/VBox/Label


func open(num_mods: int) -> void:
	
	if num_mods == 1:
		_label.text = "One of the selected mods is already installed.\nDelete and reinstall it?"
	else:
		_label.text = "%s of the selected mods are already installed.\nDelete and reinstall them?" % num_mods
	
	rect_min_size = get_tree().root.size * Vector2(0.6, 0.2)
	set_as_minsize()
	popup_centered()


func _on_BtnYes_pressed() -> void:
	
	emit_signal("response_yes")
	hide()


func _on_BtnNo_pressed() -> void:
	
	emit_signal("response_no")
	hide()


func _on_BtnCancel_pressed() -> void:
	
	hide()
