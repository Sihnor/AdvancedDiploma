extends Control
class_name DialogueSystem
# Array to hold loaded dialogues
var dialogues: Array = []
var currentIndex = 0

# Nodes
var filePath: String
@onready var nameLabelLeftRef = $Background/CharacterNamesLeft
@onready var nameLabelRightRef = $Background/CharacterNamesRight
@onready var dialogueLabelRef = $Background/DialogueText
@onready var nextButtonRef = $Background/NextBtn
@onready var choicesContainerRef = $Background/ChoicesContainer
@onready var audioRef = $AudioStreamPlayer
@onready var profileLeftRef = $ProfileLeft
@onready var profileRightRef = $ProfileRight

func _ready():
	filePath = "res://Assets/JSON/Dialogues/Scene1/TheCaptainsRoom.json"
	dialogues = loadDialoguesFromJSON(filePath)  # Load dialogues from JSON
	if dialogues.size() > 0:
		updateDialogue()

# Function to load dialogues from JSON file
func loadDialoguesFromJSON(file_path: String):
	var result = []
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:  # Check if the file opened successfully
		var content = file.get_as_text()  # Read the file content
		var json = JSON.parse_string(content)  # Parse the JSON content
		
		if json is Array:
			result = json  # Assign to dialogues array
			print("Dialogues loaded successfully!")
		else:
			print("Error: Invalid JSON format!")
		file.close()
	else:
		print("Error: Could not open JSON file at " + file_path)
	return result

func updateDialogue():
	# Clear previous choices
	for child in choicesContainerRef.get_children():
		child.queue_free()
	if currentIndex < dialogues.size():
		var currentDialogue = dialogues[currentIndex]
		nameLabelLeftRef.text = currentDialogue["nameL"]
		nameLabelRightRef.text = currentDialogue["nameR"]
		dialogueLabelRef.text = currentDialogue["text"]
		if "audio" in currentDialogue:
			if audioRef != null:
				audioRef.stream = ResourceLoader.load(currentDialogue["audio"])
				audioRef.play()
		if "profileL" in currentDialogue:
			if profileLeftRef != null:
				profileLeftRef.texture = ResourceLoader.load(currentDialogue["profileL"])
		if "profileR" in currentDialogue:
			if profileRightRef != null:
				profileRightRef.texture =  ResourceLoader.load(currentDialogue["profileR"])
		# Handle choices if they exist
		if "choices" in currentDialogue:
			showChoices(currentDialogue["choices"])
			nextButtonRef.visible = false
		else:
			choicesContainerRef.visible = false
			nextButtonRef.visible = true
	else:
		hideDialogue()

func showChoices(choices):
	choicesContainerRef.visible = true
	for choice in choices:
		var button = Button.new()
		button.text = choice["text"]
		button.pressed.connect(_on_choice_selected.bind(choice["filepath"]))
		choicesContainerRef.add_child(button)

func _on_choice_selected(filePath):
	if filePath != "":
		dialogues = loadDialoguesFromJSON(filePath)  # Load dialogues from JSON
		currentIndex = 0
	else:
		currentIndex += 1
	updateDialogue()

func _on_next_btn_pressed():
	currentIndex += 1
	if audioRef != null:
		audioRef.stop()
	updateDialogue()

func hideDialogue():
	visible = false
