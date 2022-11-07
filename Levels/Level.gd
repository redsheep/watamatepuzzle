extends Node2D


# Declare member variables here. Examples:
var isSuccess = false
var isModaled = false
export(int) var Level setget setLevel
var NextLevel
const MAX_LEVEL=30
#export(String) var unlockActor

# Called when the node enters the scene tree for the first time.
func _ready():
	$Backgroud.setLevel(Level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isSuccess:
		if !$Particles2D.emitting && $ModalSuccess.isShowed != true:
			$ModalSuccess.showModal()
	else:
		var selected = getSelected()
		if selected!=null && Input.is_action_just_released("click"):
			if selected.isFit():
				selected.snap_to_box()
			if !selected.isFree() && !selected.isFit():
				selected.cancel_grab()
			if isAllFit():
				passLevel()

func passLevel():
	isSuccess=true
	$Particles2D.emitting=true
	GameData.setLevelPassed(Level)
	GameData.unLockLevel(NextLevel)
	GameData.save_data()

func getSelected():
	for actor in $Actors.get_children():
		if actor.selected :
			return actor
	return null

func isAllFit():
	for box in $Boxes.get_children():
		if !box.isActived() :
			return false
	return true

func setLevel(val):
	Level = val
	NextLevel = val +1

func _on_panelNewActor_tree_entered():
	var unlockActor = $panelNewActor.actor
	if unlockActor!=null && GameData.is_unlock(unlockActor) == false:
		$SnapTween.interpolate_property($panelNewActor, "position",
			$panelNewActor.position, Vector2(0,0), 1.1, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		$SnapTween.start()
		GameData.unlockSheeps.append(unlockActor)
		GameData.save_data()

func _on_panelNewActor_button_exit_pressed():
	$SnapTween.interpolate_property($panelNewActor, "position",
		$panelNewActor.position, Vector2(0,-1920), 1.1, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	$SnapTween.start()


func _on_ModalSuccess_button_next_pressed():
	if NextLevel > 30:
		SceneTransition.change_scene("res://Main.tscn")
	else:
		SceneTransition.change_scene("res://Levels/Level%d.tscn"%NextLevel)


func _on_Backgroud_button_reset_pressed():
	get_tree().reload_current_scene()


func _on_Backgroud_button_return_pressed():
	SceneTransition.change_scene("res://Main.tscn")
