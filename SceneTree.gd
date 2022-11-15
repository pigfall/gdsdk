class_name PG_SceneTree

static func must_find_node(nodeInSceneTree: Node,path: String):
	var node = nodeInSceneTree.get_node(path)
	if node == null:
		panic(nodeInSceneTree,"not found node by path %s" % path)
	return node

static func panic(node_in_scene_tree: Node ,msg: String):
	var dialog = AcceptDialog.new()
	dialog.dialog_text = msg
	dialog.window_title="game crash"
	node_in_scene_tree.add_child(dialog)
	dialog.popup()
	node_in_scene_tree.get_tree().paused = true
	assert(false,"panic: %s" % msg)
	# TODO add callbck to dialog to quit game

static func must_change_scene(node: Node,scene_path:String):
	var err_code = node.get_tree().change_scene(scene_path)
	if err_code != OK :
		panic(node,"Error: change scene to %s, err code: %s" % [scene_path,err_code])

static func must_connect_signal(from:Node,signal_name: String,to:Object,method_name:String, binds: Array =[]):
	var err_code = from.connect(signal_name,to,method_name,binds)
	if err_code != OK:
		panic(from,"failed to connect signal")
		return
	
