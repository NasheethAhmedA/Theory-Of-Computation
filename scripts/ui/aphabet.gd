extends Panel

@export var char := ''
var selected := false

func _input(event):
	if selected and event.is_action_pressed("Lclick"):
		queue_free()

func _ready():
	$Label.text = char

func _on_mouse_entered():
	selected = true


func _on_mouse_exited():
	selected = false
