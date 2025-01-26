extends Node3D
class_name SlidePuzzleRiddle
@onready var slideSound : AudioStreamPlayer= $AudioStreamPlayer
@onready var timer = $Timer
@export var sound:AudioStream
@export var rewardItem : PickupItem3D
@export var gridSize: Vector2 = Vector2(3, 3) 
@export var solvedState: Array = []
@export var shuffle : bool
var emptySlot: Vector2 = Vector2(2, 2) 
var gridState: Array = []
var solved = false

func _ready():
	if solvedState.is_empty():
		solvedState = [
			["Piece1", "Piece2", "Piece3"],
			["Piece4", "Piece5", "Piece6"],
			["Piece7", "Piece8", "empty"]
		]
	
	for y in range(gridSize.y):
		var row = []
		for x in range(gridSize.x):
			row.append(null)  # Fill each cell with null initially
		gridState.append(row)

	var gridPositions = [
		Vector2(0, 0), Vector2(1, 0), Vector2(2, 0),
		Vector2(0, 1), Vector2(1, 1), Vector2(2, 1),
		Vector2(0, 2), Vector2(1, 2)  # Leave (2, 2) as emptySlot
	]
	
	var pieces = []
	for piece in get_children():
		if piece.name.begins_with("Piece"):
			pieces.append(piece)
	
	for i in range(pieces.size()):
		pieces[i].gridPosition = gridPositions[i]
		updatePiecePosition(pieces[i])
		gridState[gridPositions[i].y][gridPositions[i].x] = pieces[i].name  # Add piece to gridState
	if shuffle:
		randomizeGrid(pieces, gridPositions)
	gridState[emptySlot.y][emptySlot.x] = "empty"


func movePiece(piece):
	if not solved:
		if slideSound != null:
			slideSound.play()
		if abs(piece.gridPosition.x - emptySlot.x) + abs(piece.gridPosition.y - emptySlot.y) == 1:
			gridState[emptySlot.y][emptySlot.x] = piece.name
			gridState[piece.gridPosition.y][piece.gridPosition.x] = "empty"  # Mark piece's old slot as empty
			
			var temp = piece.gridPosition
			piece.gridPosition = emptySlot
			emptySlot = temp
			updatePiecePosition(piece)
		if checkSolved():
			solved = true
			slideSound.stream = sound
			slideSound.play()
			print("Solved!")
			if rewardItem != null:
				rewardItem.visible= true
				SceneManager.switchScene("captain_left_interaction_windowZoom", 8, null)
	

func updatePiecePosition(piece):
	piece.position = Vector3(piece.gridPosition.x, 0, piece.gridPosition.y)

func checkSolved() -> bool:
	var isSolved = true
	for y in range(gridSize.y):
		for x in range(gridSize.x):
			if gridState[y][x] != solvedState[y][x]:
				isSolved = false
				break
		if not isSolved:
			break
	return isSolved

func randomizeGrid(pieces: Array, gridPositions: Array):
	var piece_names = []
	for piece in pieces:
		piece_names.append(piece.name)
	if shuffle:
		piece_names.shuffle()
	piece_names.append("empty")  # Add "empty" slot back

	var tmpIndex = 0
	for y in range(gridSize.y):
		for x in range(gridSize.x):
			if tmpIndex < piece_names.size():
				gridState[y][x] = piece_names[tmpIndex]
				tmpIndex += 1

	# Update piece positions based on randomized grid
	var index = 0
	for y in range(gridSize.y):
		for x in range(gridSize.x):
			if gridState[y][x] != "empty":
				for piece in pieces:
					if piece.name == gridState[y][x]:
						piece.gridPosition = Vector2(x, y)
						updatePiecePosition(piece)

	# Set empty slot position
	for y in range(gridSize.y):
		for x in range(gridSize.x):
			if gridState[y][x] == "empty":
				emptySlot = Vector2(x, y)


func _on_timer_timeout():
	pass # Replace with function body.
