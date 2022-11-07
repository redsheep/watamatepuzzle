extends Node2D


# Declare member variables here. Examples:
var Music_Volume = 5
var Sound_Volume = 5
var Resolution_Width = 1366
var Resolution_Height = 768
var FullScreen = true
var Locale = "ja_JP"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()

func setResolution(width, height):
	#Resolution_Width = width
	#Resolution_Height = height
	#get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, 
	#	SceneTree.STRETCH_ASPECT_KEEP, Vector2(Resolution_Width, Resolution_Height))
	pass
	
func toggleFullScreen(fullscreen):
	FullScreen = fullscreen
	OS.set_window_fullscreen(FullScreen)
	if FullScreen != true:
		OS.set_window_size(Vector2(Resolution_Width,Resolution_Height))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func getVolume(volume):
	return log(volume)*10-20

func setVolume(name, volume):
	AudioServer.set_bus_mute(AudioServer.get_bus_index(name), volume==0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(name), getVolume(volume))
	
func setMusicVolume(volume):
	Music_Volume=volume
	setVolume("Music", volume)

func setSoundVolume(volume):
	Sound_Volume=volume
	setVolume("Sound", volume)

func setLanguage(locale):
	if locale != null:
		Locale = locale
		TranslationServer.set_locale(locale)
	
func load_data():
	var config = ConfigFile.new()
	# Load data from a file.
	var err = config.load("user://settings.cfg")
	# If the file didn't load, ignore it.
	if err != OK:
		return
	else:
		Music_Volume = config.get_value("Volume", "Music")
		Sound_Volume = config.get_value("Volume", "Sound")
		#Resolution_Width = config.get_value("Resolution", "Width")
		#Resolution_Height = config.get_value("Resolution", "Height")
		FullScreen = config.get_value("Resolution", "FullScreen")
		Locale = config.get_value("Language", "Language")
		setMusicVolume(Music_Volume)
		setSoundVolume(Sound_Volume)
		toggleFullScreen(FullScreen)
		setLanguage(Locale)
	
func save_data():
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	# Store some values.
	config.set_value("Volume", "Music", Music_Volume)
	config.set_value("Volume", "Sound", Sound_Volume)
	config.set_value("Resolution", "Width", Resolution_Width)
	config.set_value("Resolution", "Height", Resolution_Height)
	config.set_value("Resolution", "FullScreen", FullScreen)
	config.set_value("Language", "Language", Locale)
	# Save it to a file (overwrite if already exists).
	config.save("user://settings.cfg")
