extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_chapter=1
var number_chapters=4

# Called when the node enters the scene tree for the first time.
func _ready():
	number_chapters = $Chapts.get_child_count()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	SceneTransition.change_scene("res://Main.tscn")

func _set_Button_visible():
	$BtnPrev.visible = current_chapter != 1
	$BtnNext.visible = current_chapter != number_chapters
	
func _hide_Button():
	$BtnPrev.visible = false
	$BtnNext.visible = false

func _on_BtnPrev_pressed():
	if current_chapter != 1:
		_hide_Button()
		$Tween.interpolate_property($Chapts, "position",
			$Chapts.position, $Chapts.position+Vector2(1920, 0), 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		current_chapter -= 1
	_set_Button_visible()

func _on_BtnNext_pressed():
	if current_chapter != number_chapters:
		_hide_Button()
		$Tween.interpolate_property($Chapts, "position",
			$Chapts.position, $Chapts.position-Vector2(1920, 0), 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		current_chapter += 1
	_set_Button_visible()
