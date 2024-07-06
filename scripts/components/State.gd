class_name State extends Node2D


# Children Nodes
@onready var final_state_bg = $final_state_bg
@onready var label = $Label
@onready var area_2d = $Area2D
@onready var state_form = $State_Form

# All the Exports
@export_category("State Data")
@export var Final: bool = false
@export var State_Name: String = "q"
		

var Selected: bool = false
var dragged: bool = false
var colliding: bool = false
@onready var prev_pos: = global_position

func _input(event):
	if Selected:
		if event.is_action_pressed("make_final"):
			Final = not Final
			state_form.final = Final
			set_state_data()
		elif event.is_action_pressed("Rclick"):
			state_form.visible = not state_form.visible
		if event.is_action_pressed("Lclick"):
			dragged = true
		if event.is_action_released("Lclick"):
			prev_pos = global_position
			dragged = false
			

# Called when the node enters the scene tree for the first time.
func _ready():
	set_state_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if dragged and not colliding:
		global_position = lerp(global_position, get_global_mouse_position() , 25*_delta)
	elif colliding:
		global_position = prev_pos
		colliding = false

func set_state_data():
	if label and final_state_bg:
		label.text = State_Name.substr(0, 3)
		final_state_bg.visible = Final

func _on_area_2d_mouse_entered():
	Selected = true


func _on_area_2d_mouse_exited():
	Selected = false


func _on_state_form_on_data_change(New_Name, New_Final):
	State_Name = New_Name
	Final = New_Final
	set_state_data()



func _on_collider_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.global_position == global_position:
		global_position = Vector2(0, 0)
		print("move it")
	else:
		colliding = true
