@tool
extends Node2D

class_name PG_NodeExt_Circle

@export var radius =100 : set = set_radius

func set_radius(value):
	radius = value
	

@export var color: Color = Color(0.1,0.2,0.3) : set = set_color


func set_color(value):
	color =value
	

func _draw():
	draw_circle(Vector2(0,0),radius,color)
