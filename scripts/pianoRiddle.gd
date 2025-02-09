extends Node3D
class_name PianoRiddle

@onready var sfxPlayer = $sfxPlayer
@export var solution: String 
@export var dialogueSystem: DialogueSystem

var notes = []
var inputs = []
var isSolved = false

func _ready():
	if solution == "":
		solution = "EFECD"

func addInput(note: Note):
	inputs.append(note.noteID)
	checkSolution()

func addNote(note: Note) -> void:
	notes.append(note.noteID)

func clearInput():
	inputs.clear()

func checkSolution():
	var inputString: String = ""
	for input in inputs:
		inputString += input
	if inputString.length() == solution.length():
		if inputString == solution:
			sfxPlayer.play()
			isSolved = true
			await get_tree().create_timer(2.0).timeout
			dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene5/MeredithMemories.json"
			dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
			dialogueSystem.currentIndex = 0
			dialogueSystem.updateDialogue()
			dialogueSystem.visible =true
		else:
			clearInput()
	print(inputString.length())
