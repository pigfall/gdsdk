tool
extends Node2D

class_name PG_NodeExt_Circle

export var radius =100 setget set_radius

func set_radius(value):
    radius = value
    update()

export(Color) var color = Color(0.1,0.2,0.3) setget set_color


func set_color(value):
    color =value
    update()

func _draw():
    draw_circle(Vector2(0,0),radius,color)