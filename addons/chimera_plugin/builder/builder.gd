@tool
class_name ChimeraBuilder
extends Node

var build:Node

var bt:Dictionary={}

func build_obj(node:Node, is_root:bool):
	if is_root:
		build=node
	else:
		build.add_child(node)
		node.owner=build

func build_bt_branch(parent_id:String, child_id:String):
	if child_id=="":
		return
	if parent_id=="":
		build.add_child(bt[child_id])
		bt[child_id].owner=build
	else:
		bt[parent_id].add_child(bt[child_id])
		bt[child_id].owner=build

func add_bt_node(id:String, node:Node):
	bt[id]=node
