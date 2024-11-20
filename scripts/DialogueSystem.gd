extends Control

# Dialogue data
var dialogues = [
	{"name": "Narrator", "text": "Welcome to our adventure!"},
	{"name": "Player", "text": "Where do we start?"},
	{"name": "Narrator", "text": "Explore and find clues!"}
]
var currentIndex = 0

# Nodes
@onready var nameLabelRef = $Background/CharacterNames
@onready var dialogueLabelRef = $Background/DialogueText
@onready var nextButtonRef = $Background/NextBtn
@export var mainUI: Control  # Exported variable to assign the main camera

# Called when the node enters the scene tree for the first time.
func _ready():
	updateDialogue()
	if mainUI == null:
		print("Main UI system not assigned!")
		return
	mainUI.visible = false

func updateDialogue():
	if currentIndex < dialogues.size():
		var currentDialogue = dialogues[currentIndex]
		nameLabelRef.text = currentDialogue["name"]
		dialogueLabelRef.text = currentDialogue["text"]
	else:
		hideDialogue()

func onNextButtonPressed():
	currentIndex += 1
	updateDialogue()

func hideDialogue():
	visible = false
	if mainUI != null:
		mainUI.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_next_btn_pressed():
	onNextButtonPressed()
