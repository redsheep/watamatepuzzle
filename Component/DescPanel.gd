extends Node2D


# Declare member variables here. Examples:
signal button_exit_pressed()
export(String) var actor
# Called when the node enters the scene tree for the first time.

func _ready():
	$Panel/VBoxContainer/HBoxContainer/Label.text=tr("KEY_TITLE_"+actor.to_upper())
	$Panel/VBoxContainer/HBoxContainer/TextureRect.texture = load("res://Images/%s.png"%actor)	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	emit_signal("button_exit_pressed")
	pass # Replace with function body.
