extends Node2D

@export var margin_top_bottom : float = .10
@export var margin_sides : float = .15

@onready var visual: ColorRect = $ColorRect

var court_size: Vector2
var court_position: Vector2
var bounds: Dictionary

func _ready() -> void:
	setup()
	visual.position = court_position
	visual.size = court_size

func setup():
	court_size = get_court_size()
	court_position = get_court_position()
	bounds = get_court_bounds()
	print(bounds)

func get_court_size():
	var viewport = get_viewport().get_visible_rect().size

	var court_width = viewport.x - (viewport.x * margin_sides * 2)
	var court_height = viewport.y - (viewport.y * margin_top_bottom * 2)

	return Vector2(court_width, court_height)

func get_court_position():
	var viewport = get_viewport().get_visible_rect().size

	var court_x = viewport.x * margin_sides
	var court_y = viewport.y * margin_top_bottom

	return Vector2(court_x, court_y)

func get_court_bounds() -> Dictionary:
	var top_left = court_position
	var top_right = court_position + Vector2(court_size.x, 0)
	var bottom_left = court_position + Vector2(0, court_size.y)
	var bottom_right = court_position + court_size

	return {
		"top": PackedVector2Array([top_left, top_right]),
		"bottom": PackedVector2Array([bottom_left, bottom_right]),
		"left": PackedVector2Array([top_left, bottom_left]),
		"right": PackedVector2Array([top_right, bottom_right]),
	}
