extends Node2D

@onready var menu_area = $CanvasLayer/MenuArea
@onready var menu_btn = $CanvasLayer/MenuBtn

var Menu_Width:= 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	menu_area.custom_minimum_size.x = lerp(menu_area.custom_minimum_size.x, Menu_Width, 10*delta)
	if floor(menu_area.custom_minimum_size.x) < 50:
		menu_btn.visible = true


func _on_menu_area_mouse_exited():
	Menu_Width = 0.0


func _on_menu_btn_pressed():
	menu_btn.visible = false
	Menu_Width = 324.0
