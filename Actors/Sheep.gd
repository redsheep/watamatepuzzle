extends KinematicBody2D


# Declare member variables here. Examples:
var can_grab = false
var grabbed_offset = Vector2()
var collisions = Array()
var old_position = Vector2()
var selected = false
var left_top_offset=Vector2(0,0)
var in_stage = false
export var EX_COUNT = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	old_position = position
	connect("mouse_entered", self, "_on_Node2D_mouse_entered")
	connect("mouse_exited", self, "_on_Node2D_mouse_exited")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and selected:
		position = get_global_mouse_position() + grabbed_offset
	if Input.is_action_just_released("click"):
		selected=false
		if !isFit():
			snap_to(old_position)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		var active = false
		if event.button_index==BUTTON_RIGHT && !in_stage:
			active = true
			rotate(-PI / 2)
		elif event.button_index==BUTTON_LEFT:
			active = true
			selected = event.is_pressed()
			grabbed_offset = position - get_global_mouse_position()
			stop_playing()
			z_index=99
		if active:
			AudioManager.playSound("click")

func get_collided_archor():
	if collisions.size() == 0:
		return null
	var v = collisions[0].position;
	for c in collisions:
		v.x=min(v.x, c.position.x)
		v.y=min(v.y, c.position.y)
	return v-Vector2(32,32)

func get_left_top():
	var lt=$LT.global_position-global_position
	var rb=$RB.global_position-global_position
	return Vector2(min(lt.x,rb.x), min(lt.y,rb.y))
	
func snap_to_box():
	stop_playing()
	AudioManager.playSound("drop")
	var target = get_collided_archor() - get_left_top()
	snap_to(target)
	z_index=90
	
func snap_to(pos):
	$SnapTween.interpolate_property(self, "position",
		position, pos, .1, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	$SnapTween.start()
			
func isFit():
	return collisions.size()==EX_COUNT

func isFree():
	return !in_stage;#collisions.size()==0

func cancel_grab():
	AudioManager.playSound("pick")
	snap_to(old_position)


func _on_Node2D_mouse_entered():
	if !in_stage:
		start_playing()

func _on_Node2D_mouse_exited():
	stop_playing()

func start_playing():
	if $Sprite!=null && $Sprite is AnimatedSprite:
		$Sprite.play("playing")
	if $MusicNotes != null:
		$MusicNotes.emitting=true

func stop_playing():
	if $Sprite!=null && $Sprite is AnimatedSprite:
		$Sprite.play("default")
	if $MusicNotes != null:
		$MusicNotes.emitting=false
	
