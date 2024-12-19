extends Control

# Array to hold loaded dialogues
var dialogues: Array = []
var currentIndex = 0

# Nodes
@export var filePath: String
@onready var nameLabelRef = $Background/CharacterNames
@onready var dialogueLabelRef = $Background/DialogueText
@onready var nextButtonRef = $Background/NextBtn
@onready var choicesContainerRef = $Background/ChoicesContainer

func _ready():
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
		nameLabelRef.text = currentDialogue["name"]
		dialogueLabelRef.text = currentDialogue["text"]
		
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
		currentIndex =0
	else:
		currentIndex += 1
	updateDialogue()

func _on_next_btn_pressed():
	currentIndex += 1

	updateDialogue()

func hideDialogue():
	visible = false
