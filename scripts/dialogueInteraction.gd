extends Control
class_name DialogueInteration

@onready var button =$Button
@export var dialogueSystem:DialogueSystem
@export var filePath:String
@export var isSelfDestroy = false
@export var isEndScene = false
@export var buttonIcon: CompressedTexture2D
var shouldReset = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if buttonIcon != null:
		button.icon = buttonIcon
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
		if isSelfDestroy:
			self.queue_free()
		if isEndScene:
			dialogueSystem.isEndScene = isEndScene
