extends CanvasLayer

func change_scene(target: String, type: String = 'dissolve') -> void:
	transition_dissolve(target)

func transition_dissolve(target: String) -> void:
	$Node2D.visible = true
	$AnimationPlayer.play("swapIn")
	yield($AnimationPlayer,'animation_finished')
	$Node2D.visible = false
	get_tree().change_scene(target)
	$AnimationPlayer.play("swapOut")
	playBGM(target)

func playBGM(target):
	if target.begins_with('res://Levels'):
		AudioManager.playBGM("game")
	else:
		AudioManager.playBGM("main")
	
