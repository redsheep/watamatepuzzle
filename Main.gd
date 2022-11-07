extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#TranslationServer.set_locale('ja')
	$AnimationPlayer.play("fade_in")
	yield($AnimationPlayer,'animation_finished')
	$AnimationPlayer.play("start_anim")
	AudioManager.playBGM('main')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BtnPlay_pressed():
	SceneTransition.change_scene("res://Scenes/Chapters.tscn")
	pass # Replace with function body.


func _on_BtnMember_pressed():
	SceneTransition.change_scene("res://Scenes/Member.tscn")
	pass # Replace with function body.


func _on_BtnOption_pressed():
	SceneTransition.change_scene("res://Scenes/Options.tscn")
	pass # Replace with function body.


func _on_BtnQuit_pressed():
	get_tree().quit()
	pass # Replace with function body.
