class_name PG_Queue

var count:int=0
var first_elem
var last_elem

func push_back(elem):
	var old_count = count
	count = count+1
	if old_count == 0:
		last_elem={"elem":elem}
		first_elem = {"elem":elem,"next":last_elem}
		return
	if old_count == 1:
		last_elem["elem"] = elem
		return

	var new_last = {"elem":elem}
	last_elem["next"] = new_last
	last_elem = new_last

func pop_front():
	if count == 0 :
		return null
	if count == 1:
		var elem = first_elem
		first_elem = null
		last_elem = null
		count = count - 1
		return elem
	if count == 2:
		first_elem = last_elem
		last_elem = {"elem":first_elem.get("elem")}
		count = count - 1
		return
	var elem = first_elem.get("elem")
	first_elem = first_elem.get("next")
	count = count - 1
	return elem

func print():
	var list = []
	var elem = first_elem
	while elem != null:
		list.push_back(elem)
		elem=elem.get("next")
	print("total ",count, "elems: ",list)
