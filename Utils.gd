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
		
	
	
