extends Node

class_name SDKGlobal

static var Singleton:SDKGlobal=null
static var exited:bool=false
func _ready():
	SDKGlobal.Singleton= get_node("/root/Global")


