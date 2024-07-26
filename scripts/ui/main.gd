extends Control

@onready var parallax_layer = $ParallaxBackground/ParallaxLayer
@onready var parallax_layer_2 = $ParallaxBackground/ParallaxLayer2
@onready var playbtn = $Main_UI/Panel/Playbtn
@onready var quitbtn = $Main_UI/Panel/Quitbtn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_layer.set_motion_offset(Vector2(parallax_layer.motion_offset))
	parallax_layer_2.set_motion_offset(Vector2(parallax_layer_2.motion_offset))
	
	parallax_layer.motion_offset += Vector2(randf(), randf())
	parallax_layer_2.motion_offset -= Vector2(randf(), randf())


func _on_btn_mouse_entered():
	MusicPlayer.play("hover_sfx")


func _on_btn_mouse_exited():
	MusicPlayer.play("unhover_sfx")


func _on_playbtn_pressed():
	MusicPlayer.play("press_sfx")
	get_tree().change_scene_to_file("res://scenes/playgrounds/dfa.tscn")


func _on_quitbtn_pressed():
	MusicPlayer.play("press_sfx")
	get_tree().quit()


func _on_aboutbtn_pressed():
	MusicPlayer.play("press_sfx")
	get_tree().change_scene_to_file("res://scenes/ui/about.tscn")
