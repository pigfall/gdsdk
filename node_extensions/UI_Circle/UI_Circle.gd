tool
extends Control

class_name PG_NodeExt_UI_Circle

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

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
