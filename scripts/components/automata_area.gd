extends Node2D

signal new_state_added(state)

@export var State_Scene: PackedScene

@onready var cam = $Cam
@onready var panel = $BG/Panel

var zoomTarget: Vector2
var DragStartMousePos := Vector2.ZERO
var DragStartCamPos := Vector2.ZERO
var dragging := false

func _input(event):
	if event.is_action_pressed("new_state"):
		var new_state = State_Scene.instantiate()
		new_state.global_position = get_global_mouse_position()
		add_child(new_state)
		new_state_added.emit(new_state)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_state_added.emit($State)
	zoomTarget = cam.zoom


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom(delta)
	pan(delta)


func zoom(delta):
	if Input.is_action_just_pressed("scroll_up"):
		zoomTarget *= 1.1
	if Input.is_action_just_pressed("scroll_down"):
		zoomTarget *= 0.9
		
	cam.zoom = cam.zoom.slerp(zoomTarget, 10*delta)

func pan(delta):
	if !dragging and Input.is_action_just_pressed("MIDclick"):
		DragStartMousePos = cam.get_viewport().get_mouse_position()
		DragStartCamPos = cam.position
		dragging = true
	if dragging and Input.is_action_just_released("MIDclick"):
		dragging = false
		panel.set_default_cursor_shape(0)
	if dragging:
		panel.set_default_cursor_shape(13)
		var MovePos = cam.get_viewport().get_mouse_position() - DragStartMousePos
		cam.position = DragStartCamPos - MovePos * 1/cam.zoom.x
	
