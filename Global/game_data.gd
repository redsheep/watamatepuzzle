extends Node2D


# Declare member variables here. Examples:
var passwordStr = "tsunomakiwatame"
var unlockSheeps = []
var unlockLevels = [1]
var passedLevels = []


# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func is_passed_level(level):
	for passed in passedLevels:
		if level == passed:
			return true
	return false

func is_unlock_Lvel(level):
	for unlock in unlockLevels:
		if level == unlock:
			return true
	return false

func is_unlock(id):
	for sheep in unlockSheeps:
		if sheep == id:
			return true
	return false

func unLockLevel(level):
	unlockLevels.append(level)
	
func setLevelPassed(level):
	passedLevels.append(level)
	
func unLockSheep(sheep):
	unlockSheeps.append(sheep)

func load_data():
	var config = ConfigFile.new()
	# Load data from a file.
	var err = config.load("user://savedata.dat")
	# If the file didn't load, ignore it.
	if err != OK:
		return
	else:
		unlockSheeps = config.get_value("Data", "Sheeps")
		unlockLevels = config.get_value("Data", "Levels")
		passedLevels = config.get_value("Data", "Passed")
		
	
func save_data():
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	# Store some values.
	config.set_value("Data", "Sheeps", array_unique(unlockSheeps))
	config.set_value("Data", "Levels", array_unique(unlockLevels))
	config.set_value("Data", "Passed", array_unique(passedLevels))
	# Save it to a file (overwrite if already exists).
	config.save("user://savedata.dat")

func array_unique(array: Array) -> Array:
	var unique: Array = []
	for item in array:
		if not unique.has(item):
			unique.append(item)
	return unique
