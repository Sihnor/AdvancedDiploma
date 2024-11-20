extends Control

@export var inventorySystem: Control  # Exported variable to assign the main camera

# Inventory data
var isInventoryOpen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if inventorySystem == null:
		print("Inventory system not assigned!")
		return
	inventorySystem.visible = isInventoryOpen

func _on_top_bar_icon_pressed():
	if inventorySystem != null:
		if isInventoryOpen:
			inventorySystem.visible = false
			isInventoryOpen = false
		else:
			inventorySystem.visible = true
			isInventoryOpen = true
		
