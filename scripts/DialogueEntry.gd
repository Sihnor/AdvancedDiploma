extends Resource
class_name DialogueEntry

@export var name: String
@export var text: String
@export var choices: Array[Dictionary]  # Optional for multiple-choice support
