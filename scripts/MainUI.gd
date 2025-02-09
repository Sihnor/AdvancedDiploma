extends Control

@export var inventorySystem: Control
@onready var test = $Background/ItemSlots/Item

var isInventoryOpen = false

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
		
