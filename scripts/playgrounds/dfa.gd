extends Node2D

@onready var menu_area = $CanvasLayer/MenuArea
@onready var menu_btn = $CanvasLayer/MenuBtn
@onready var qdata = $CanvasLayer/MenuArea/Qdata
@onready var alpha_container = $CanvasLayer/MenuArea/AlphaContainer
@onready var aplha_char = $CanvasLayer/MenuArea/AplhaChar

var _aplhabet_scene = preload("res://scenes/ui/aphabet.tscn")
var Menu_Width:= 0.0
var states := []
var alphabets := []


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Menu_Width = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	MenuBar(delta)
	_handle_states_data()
	


func _handle_states_data():
	states = states.filter(func (x): return is_instance_valid(x))
	_set_Qdata()
	

func _set_Qdata():
	#qdata.text = '{ ' + ''.join(states.map(func (x): return x.State_Name + ' ')) + '}'
	qdata.text = str(states.map(func (x): return x if x is String else x.State_Name)).replace('"', '')\
	.replace('[', '{ ')\
	.replace(']', ' }')
	#print(states.map(func (x): return x if x is String else x.State_Name))

func MenuBar(delta):
	menu_area.custom_minimum_size.x = lerp(menu_area.custom_minimum_size.x, Menu_Width, 10*delta)
	if floor(menu_area.custom_minimum_size.x) < 40:
		menu_btn.visible = true
	else:
		menu_btn.visible = false


func _on_menu_btn_pressed():
	Menu_Width = get_viewport().size.y / 2


func _on_automata_area_new_state_added(state):
	states.append(state)


func _on_alpha_input_pressed():
	MusicPlayer.play("press_sfx")
	var alphabet = _aplhabet_scene.instantiate()
	alphabet.char = aplha_char.text
	aplha_char.clear()
	alpha_container.add_child(alphabet)
	alphabets.append(alphabet)


func _on_btn_mouse_entered():
	MusicPlayer.play("hover_sfx")

func _on_btn_mouse_exited():
	MusicPlayer.play("unhover_sfx")


func _on_back_btn_pressed():
	MusicPlayer.play("press_sfx")
	get_tree().change_scene_to_file("res://scenes/ui/main.tscn")
