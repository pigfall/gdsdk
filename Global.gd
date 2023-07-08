extends Node

class_name SDKGlobal

static var Singleton:SDKGlobal=null

func _ready():
	SDKGlobal.Singleton= get_node("/root/Global")


