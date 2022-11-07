extends Node2D


# Declare member variables here. Examples:
#var arr=[[-1,-1,-1],
#		 [-1,-1,-1],
#		 [-1,-1,-1]];
var actived = false;
onready var sprite = get_node("Untitled-x")

var active_tex = load("res://Images/Untitled-x-a.png")
var normal_tex = load("res://Images/Untitled-x.png")
var bodies = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	#for x in len(arr):
	#	for y in len(arr[x]):
	#		var n = sprite.duplicate()
	#		n.position.x=x*64;
	#		n.position.y=y*64;
	#		add_child(n)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Node2D_body_entered(body):
	pass # Replace with function body.


func _on_Node2D_body_exited(body):
	pass # Replace with function body.

func isActived():
	return bodies.size()>0;


func _on_Node2D_area_entered(area):
	var body = area.get_parent()
	if isActived():
		return;
	bodies.append(body)
	sprite.set_texture(active_tex)
	body.collisions.append(self)
	pass # Replace with function body.


func _on_Node2D_area_exited(area):
	var body = area.get_parent()
	bodies.erase(body)
	body.collisions.erase(self)
	if !isActived():
		sprite.set_texture(normal_tex)
	pass # Replace with function body.
