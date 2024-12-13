extends Node3D

@export var solution: String 
var input = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addBook(book: Book) -> void:
	input.append(book)

func getBook(id: String) -> Book:
	var result = ""
	for book in input:
		if book.bookID == id:
			result = book
	return result
