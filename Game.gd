extends Node

class_name SDKGame

static func exit(code:int,errMsg:String):
	var tree:SceneTree = SDKGame.scene_tree()
	var dialog = AcceptDialog.new()
	dialog.connect("confirmed",func():tree.quit(code))
	dialog.connect("canceled",func():tree.quit(code))
	dialog.size=Vector2i(150,150)
	dialog.dialog_text = errMsg
	dialog.title="game exiting"
	tree.get_current_scene().add_child.call_deferred(dialog)
	dialog.popup.call_deferred()
	dialog.process_mode = Node.PROCESS_MODE_ALWAYS
	print(errMsg)
	tree.paused = true

static func scene_tree()->SceneTree:
	return SDKGlobal.Singleton.get_tree()
	
static func current_scene()->Node:
	return SDKGame.scene_tree().get_current_scene()
