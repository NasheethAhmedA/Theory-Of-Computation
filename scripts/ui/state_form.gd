extends Control

signal on_data_change(New_Name, New_Final)

@onready var name_edit = $Panel/NameEdit
@onready var is_final = $Panel/isFinal

var Name := ""
var final := false:
	set (value):
		final = value
		is_final.button_pressed = value

func _on_exit_btn_pressed():
	visible = false


func _on_set_btn_pressed():
	on_data_change.emit(Name, final)
	visible =false


func _on_name_edit_text(new_text):
	Name = new_text




func _on_is_final_toggled(toggled_on):
	final = toggled_on

