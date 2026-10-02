extends Node2D

@export var point : Texture2D
var viewport

func _ready() -> void:
	setup()

func setup():
	viewport = get_viewport().get_visible_rect().size
	print(viewport)
	pass
