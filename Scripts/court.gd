extends Node2D

@export var point : Texture2D

func _ready() -> void:
	setup()

func setup():
	var viewport = get_viewport().get_visible_rect().size
	print(viewport)
	instantiate_point(Vector2.ZERO)

func instantiate_point(position : Vector2):
	var point_instance = Sprite2D.new()
	point_instance.texture = point
	point_instance.position = position
	add_child(point_instance)
