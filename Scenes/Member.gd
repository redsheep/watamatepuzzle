extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#save_data()
	for panel in $GridContainer.get_children():
		panel.locked = !GameData.is_unlock(panel.actorId)
		panel.connect("item_mouse_over", self, "_on_Mouse_Over")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	SceneTransition.change_scene("res://Main.tscn")
	pass # Replace with function body.


func _on_Mouse_Over(sender):
	$Panel/TextureRect.texture = sender.texture
	$Panel/Label.text=tr("KEY_TITLE_%s"%sender.actorId.to_upper())
	pass
