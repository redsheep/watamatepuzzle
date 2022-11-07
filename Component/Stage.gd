extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_body_entered(body):
	body.in_stage=true;
	pass # Replace with function body.


func _on_Node2D_body_exited(body):
	body.in_stage=false;
	pass # Replace with function body.

func _on_Node2D_area_entered(area):
	area.get_parent().in_stage=true;
	pass # Replace with function body.


func _on_Node2D_area_exited(area):
	area.get_parent().in_stage=false;
	pass # Replace with function body.
