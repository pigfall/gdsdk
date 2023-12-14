extends Node

class_name Utils

static func panic(node_in_tree:Node,msg: String):
	# The print_stack only works when in debug version and connecting to a debug server
	print_stack()
	push_error("DEBUG: Root error: %s" % msg)
	PG_SceneTree.panic(node_in_tree,msg)
	
static func panic_if(match: bool, node_in_tree, msg:String):
	if not match:
		return
	panic(node_in_tree,msg)
	
static func dialog(node_in_tree:Node ,title: String, message: String,on_confirmed:Callable,on_canceled:Callable):
	var accept_dialog = AcceptDialog.new()
	accept_dialog.title = title
	accept_dialog.dialog_text = message
	accept_dialog.confirmed.connect(on_confirmed)
	accept_dialog.canceled.connect(on_canceled)
	accept_dialog.process_mode = Node.PROCESS_MODE_ALWAYS
	node_in_tree.add_child(accept_dialog)
	accept_dialog.popup_centered()
	
	

# Result<AudioStreamMP3>
static func load_mp3(path:String)->Result:
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		var err = FileAccess.get_open_error()
		return Result.with_err(err)
	var stream = AudioStreamMP3.new()
	stream.data = file.get_buffer(file.get_length())
	file.close()
	return Result.with_value(stream)

static func load_resource(path: String)->Result:
	var resource = load(path) 
	if resource == null:
		return Result.with_err("load %s error" % path)
	return Result.with_value(resource)
	

static func load_or_panic(nodeInTree: Node,path: String):
	var resource = load(path)
	if resource != null:
		return resource
	panic(nodeInTree,"load %s error" % path)
		
static func change_scene(node_in_tree:Node,scene_path: String):
	var err = node_in_tree.get_tree().change_scene_to_file(scene_path)
	if err != null:
		panic(node_in_tree,"failed to change to scene %s, error code %s" % [scene_path,err])
	
