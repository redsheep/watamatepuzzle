extends Node2D


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	SceneTransition.change_scene("res://Main.tscn")
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	GameSettings.setMusicVolume(value)
	pass # Replace with function body.


func _on_HSlider2_value_changed(value):
	GameSettings.setSoundVolume(value)
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	GameSettings.toggleFullScreen(button_pressed)
	pass # Replace with function body.


func _on_Node2D_tree_entered():
	$Panel/VBoxContainer/HBoxContainer/HSlider.value=GameSettings.Music_Volume
	$Panel/VBoxContainer/HBoxContainer2/HSlider2.value=GameSettings.Sound_Volume
	$Panel/VBoxContainer/HBoxContainer3/CheckBox.pressed=GameSettings.FullScreen
	pass # Replace with function body.


func _on_Button_pressed():
	GameSettings.save_data()
	SceneTransition.change_scene("res://Main.tscn")
	pass # Replace with function body.


func _on_ButtonJP_pressed():
	GameSettings.setLanguage("ja_JP")
	pass # Replace with function body.


func _on_ButtonEN_pressed():
	GameSettings.setLanguage("en_US")
	pass # Replace with function body.


func _on_ButtonCN_pressed():
	GameSettings.setLanguage("zh_CN")
	pass # Replace with function body.
