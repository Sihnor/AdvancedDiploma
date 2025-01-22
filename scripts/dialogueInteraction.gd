extends Control
class_name DialogueInteration

@export var dialogueSystem:DialogueSystem
@export var filePath:String
var shouldReset = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if dialogueSystem != null and filePath != "":
		dialogueSystem.filePath = filePath
		dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
		dialogueSystem.currentIndex = 0
		dialogueSystem.updateDialogue()
		dialogueSystem.visible = true
		
	pass # Replace with function body.
