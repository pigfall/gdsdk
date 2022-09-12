class_name PG_SceneTree

static func must_find_node(nodeInSceneTree: Node,path: String):
	var node = nodeInSceneTree.get_node(path)
	assert(node!=null,"not found node by path %s" % path)
	return node

