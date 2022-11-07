tool
extends TextureButton
class_name LevelCell

# Declare member variables here. Examples:
export(int) var level setget setLevel
export(bool) var locked setget setLock
export(bool) var isPass setget setPass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setLevel(value):
	level = value
	$Label.text = str(value)

func setLock(value):
	locked = value
	$Locked.visible = value
	
func setPass(value):
	isPass = value
	$Ribon.visible = value


func _on_LevelCell_pressed():
	if locked == false:
		AudioManager.playSound("click")
		SceneTransition.change_scene("res://Levels/Level%d.tscn"%level)
	else:
		AudioManager.playSound("lock")

func _on_LevelCell_mouse_entered():
	if locked == false:
		rect_scale=Vector2(1.05, 1.05)


func _on_LevelCell_mouse_exited():
	if locked == false:
		rect_scale=Vector2(1, 1)
