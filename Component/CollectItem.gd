tool
extends PanelContainer

# Declare member variables here. Examples:
export(String) var actorId
export(bool) var locked setget setLock
export(Texture) var texture setget setTexture
signal item_mouse_over(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setLock(val):
	locked = val
	if locked:
		$Texture.modulate = Color(0,0,0,1)
	else:
		$Texture.modulate = Color(1,1,1,1)

func setTexture(val):
	texture = val
	$Texture.texture = val

func _on_PanelSheepA_mouse_entered():
	if locked == false:
		emit_signal("item_mouse_over", self)
	self.rect_scale = Vector2(1.01,1.01)


func _on_PanelSheepA_mouse_exited():
	self.rect_scale = Vector2(1,1)
