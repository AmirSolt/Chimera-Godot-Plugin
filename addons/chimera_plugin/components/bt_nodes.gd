@tool
class_name ChimeraBTNodes
extends Node


func create_bt_node(name:String)->Node:
	var node:= Node.new()
	node.name=name
	return node
