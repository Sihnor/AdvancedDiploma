extends Node3D
class_name BookRiddle

@onready var audioStreamPlayer = $AudioStreamPlayer
@export var solution: String 
@export var shuffled: bool
@export var rewardSound:AudioStream
var books = []
var inputs = []
var isSolved = false

func _ready():
	if shuffled:
		shuffleBooks()
	
func addInput(book: Book):
	inputs.append(book)

func addBook(book: Book) -> void:
	books.append(book)

func clearInput():
	var currentBooks = self.get_children()
	for book in currentBooks:
		if book is Book:
			var t: Book = book
			#t.isSelected = false
	inputs.clear()

func swapBook(source: Book, destination: Book):
	var sourceIndex: int = books.find(source)
	var destinationIndex: int = books.find(destination)

	# Swap the positions of the source and destination books
	var tempPosition = source.position
	source.position = destination.position
	destination.position = tempPosition

	# Swap the books in the array
	var tempBook: Book = books[sourceIndex]
	books[sourceIndex] = books[destinationIndex]
	books[destinationIndex] = tempBook
	pass

func checkSolution():
	audioStreamPlayer.play()
	print(books)
	var inputString :String = ""
	for book in books:
		var tmpBook: Book = book
		inputString += tmpBook.bookID
	if inputString == solution:
		if rewardSound != null:
			audioStreamPlayer.stream = rewardSound
			audioStreamPlayer.play()
		print("Solved")
		isSolved = true

func shuffleBooks():
	# Randomize the order of books in the array
	for i in range(len(books)):
		var randomIndex = randi() % len(books)
		if i != randomIndex:  # Avoid swapping an element with itself
			swapBook(books[i], books[randomIndex])
