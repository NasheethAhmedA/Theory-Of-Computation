extends Control

signal on_data_change(New_Name, New_Final)
signal delete_pressed

@onready var name_edit = $Panel/NameEdit
@onready var is_final = $Panel/isFinal

var Name := ""
var final := false:
	set (value):
		final = value
		is_final.button_pressed = value

func _on_exit_btn_pressed():
	MusicPlayer.play("press_sfx")
	visible = false


func _on_set_btn_pressed():
	MusicPlayer.play("press_sfx")
	on_data_change.emit(Name, final)
	visible =false


func _on_name_edit_text(new_text):
	Name = new_text




func _on_is_final_toggled(toggled_on):
	final = toggled_on



func _on_delete_btn_pressed():
	MusicPlayer.play("press_sfx")
	delete_pressed.emit()


func _on_name_edit_text_submitted(new_text):
	on_data_change.emit(Name, final)
	visible =false


func _on_btn_mouse_entered():
	MusicPlayer.play("hover_sfx")


func _on_btn_mouse_exited():
	MusicPlayer.play("unhover_sfx")
