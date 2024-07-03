class_name State extends Node2D

# All the Exports
@export_category("State Data")
@export var Final: bool = false
@export var State_Name: String = "q"

# Children Nodes
@onready var final_state_bg = $final_state_bg
@onready var label = $Label
@onready var area_2d = $Area2D
@onready var state_form = $State_Form

var Selected: bool = false
var dragged: bool = false

func _input(event):
	if Selected:
		if event.is_action_pressed("make_final"):
			Final = not Final
		elif event.is_action_pressed("info"):
			state_form.visible = not state_form.visible
		if event.is_action_pressed("drag"):
			dragged = true
		if event.is_action_released("drag"):
			dragged = false
			
		


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Set_State_Data()
	if dragged:
		global_position = lerp(global_position, get_viewport().get_mouse_position(), 25*_delta)


# Set the State data from the export values
func Set_State_Data():
	State_Name = State_Name.substr(0, 3)
	final_state_bg.visible = Final
	label.text = State_Name



func _on_area_2d_mouse_entered():
	Selected = true


func _on_area_2d_mouse_exited():
	Selected = false
