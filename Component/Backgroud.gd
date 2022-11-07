extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var level setget setLevel

signal button_return_pressed()
signal button_reset_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setLevel(val):
	level = val
	$Label.text = "Level%d"%level

func _on_BtnReturn_pressed():
	emit_signal("button_return_pressed")
	pass # Replace with function body.


func _on_BtnReset_pressed():
	emit_signal("button_reset_pressed")
	pass # Replace with function body.


func _on_BtnReturn_mouse_entered():
	$Node2D/BtnReturn.rect_scale=Vector2(1.1, 1.1)

func _on_BtnReturn_mouse_exited():
	$Node2D/BtnReturn.rect_scale=Vector2(1, 1)

func _on_BtnReset_mouse_entered():
	$Node2D/BtnReset.rect_scale=Vector2(1.1, 1.1)

func _on_BtnReset_mouse_exited():
	$Node2D/BtnReset.rect_scale=Vector2(1, 1)
