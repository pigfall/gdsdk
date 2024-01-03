@tool
extends Control

class_name PG_NodeExt_UI_Circle

@export var radius =100 : set = set_radius

func set_radius(value):
	radius = value

@export var color: Color = Color(0.1,0.2,0.3) : set = set_color


func set_color(value):
	color =value

func _draw():
	draw_circle(Vector2(0,0),radius,color)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
