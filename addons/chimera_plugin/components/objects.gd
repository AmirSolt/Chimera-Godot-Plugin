@tool
class_name ChimeraObjets
extends Node


const DIMENSION_SYSTEM="System"
const DIMENSION_UI="UI"
const DIMENSION_2D="2D"
const DIMENSION_3D="3D"

var dimension_objects:Dictionary={
	DIMENSION_SYSTEM:Node,
	DIMENSION_UI:Control,
	DIMENSION_2D:Node2D,
	DIMENSION_3D:Node3D,
}

var objects:Dictionary={
	"CharacterBody3D":CharacterBody3D
	
}


func create_obj(context_key:String, type:String, dimension:String="", script:String="")->Node:
	if objects.has(type):
		var node = objects[type].new()
		node.name=context_key
		return node
	var node:Node = dimension_objects[dimension].new()
	node.name=context_key
	var gd_script:=GDScript.new()
	gd_script.source_code=script
	node.set_script(gd_script)
	return node
