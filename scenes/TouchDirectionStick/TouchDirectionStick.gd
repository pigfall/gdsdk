@tool
extends PG_NodeExt_Circle

class_name PG_TouchDirectionStick

static func create()-> PG_TouchDirectionStick:
	var scene = load("res://gdsdk/scenes/TouchDirectionStick/TouchDirectionStick.tscn")
	return scene.instantiate()

signal on_touch
signal on_release
signal on_drag
signal on_double_touch

var  stick:PG_NodeExt_Circle
var is_touching:bool = false
var touching_id =null
var touch_time_in_msec:int=0

var callback_on_touch = null
var callback_on_release = null
var callback_on_drag = null
var callback_on_double_touch = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stick = UtilsFactory.SceneTree().must_find_node(self,"Stick")
	self.adjust()

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		self.handle_screen_touch_input(event)
	elif event is InputEventScreenDrag:
		self.handle_screen_drag_input(event)


func handle_screen_drag_input(drag:InputEventScreenDrag):
	if drag.index == self.touching_id:
		if drag.position.distance_to(self.global_position) < (self.radius):
			self.stick.global_position = drag.position
		else:
			self.stick.global_position = drag.position
			self.stick.global_position = self.global_position + (self.stick.global_position - self.global_position).limit_length(self.radius)
		self.on_drag.emit((self.stick.global_position-self.global_position).normalized())
		if (self.callback_on_drag != null):
			self.callback_on_drag.call((self.stick.global_position-self.global_position).normalized())

	
func handle_screen_touch_input(touch: InputEventScreenTouch):
	if (self.is_touching):
		if (touch.index==self.touching_id):
			if (not touch.pressed):
				self.is_touching = false
				self.touching_id = null
				self.stick.position = Vector2(0,0)
				on_release.emit()
				if (self.callback_on_release != null ):
					self.callback_on_release.call()
	else:
		if (touch.position.distance_to(self.global_position) < (self.radius)):
			self.stick.global_position = touch.position
			self.is_touching = true
			self.touching_id =touch.index
			var prev_touch_time = self.touch_time_in_msec
			self.touch_time_in_msec = Time.get_ticks_msec()
			if (self.touch_time_in_msec - prev_touch_time <300):
				on_double_touch.emit((self.stick.global_position-self.global_position).normalized())
				if  self.callback_on_double_touch != null:
					self.callback_on_double_touch.call((self.stick.global_position-self.global_position).normalized())
					return 
			on_touch.emit((self.stick.global_position-self.global_position).normalized())
			if (self.callback_on_touch != null):
				self.callback_on_touch.call((self.stick.global_position-self.global_position).normalized())

func adjust():
	var resolution = DisplayServer.window_get_size()
	self.global_position = Vector2(self.radius+100,resolution.y-self.radius-100)
