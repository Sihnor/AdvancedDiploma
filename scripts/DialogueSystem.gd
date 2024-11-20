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

# Called when the node enters the scene tree for the first time.
func _ready():
	updateDialogue()

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_btn_pressed():
	onNextButtonPressed()
