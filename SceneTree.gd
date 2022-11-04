class_name PG_SceneTree

static func must_find_node(nodeInSceneTree: Node,path: String):
	var node = nodeInSceneTree.get_node(path)
	assert(node!=null,"not found node by path %s" % path)
	return node

static func panic(node_in_scene_tree: Node ,msg: String):
	var dialog = AcceptDialog.new()
	node_in_scene_tree.add_child(dialog)
	dialog.popup()
	node_in_scene_tree.get_tree().paused = true
	# TODO add callbck to dialog to quit game
