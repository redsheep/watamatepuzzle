extends Node
class_name Chapter

# Declare member variables here. Examples:
export(int) var offset

# Called when the node enters the scene tree for the first time.
func _ready():
	for ctrl in $GridContainer.get_children():
		if ctrl is LevelCell:
			ctrl.locked = true
			if GameData.is_unlock_Lvel(ctrl.level):
				ctrl.locked = false
			if GameData.is_passed_level(ctrl.level):
				ctrl.isPass = true
	pass # Replace with function body.
