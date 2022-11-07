extends Node2D


# Declare member variables here. Examples:
#signal modal_showed()
signal button_next_pressed()
var isShowed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showModal():
	isShowed = true
	AudioManager.playSound("crrect_answer")
	$AnimationPlayer.play("showModal")
	yield($AnimationPlayer,"animation_finished")
	$BtnNext.visible = true


func _on_BtnNext_pressed():
	emit_signal("button_next_pressed")
