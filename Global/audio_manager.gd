extends Node2D


# Declare member variables here. Examples:
#onready var mainBGM = load("res://Audios/mainBGM.mp3")
#onready var gameBGM = load("res://Audios/gameBGM.mp3")
var playingBGM = null
var playingSound = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func playBGM(name):
	if playingBGM==name:
		return;
	$BGMPlayer.stop()
	$BGMPlayer.stream = load("res://Audios/"+name+"BGM.mp3")
	$BGMPlayer.play()
	playingBGM=name

func stopBGM():
	$BGMPlayer.stop()

func playSound(name):
	$SoundPlayer.stop()
	$SoundPlayer.stream = load("res://Audios/"+name+".wav")
	$SoundPlayer.play()
	playingSound=name
