extends Node

func play(track: String):
	var sound:AudioStreamPlayer = get_children().filter(func(x): return x.get_name() == track)[0]
	sound.play()
