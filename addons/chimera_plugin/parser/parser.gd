@tool
class_name ChimeraParser
extends Node

@onready var builder: ChimeraBuilder = $"../Builder"
@onready var objects: ChimeraObjets = $"../Objects"
@onready var bt_nodes: ChimeraBTNodes = $"../BTNodes"
@onready var exporter: ChimeraExporter = $"../Exporter"

func parse(target_json:String):
	var dict = JSON.parse_string(target_json)
	if dict==null:
		print("Something went wrong when parsing json.")
		return

#	Building Objects
	var context = dict["context"]
	var root = objects.create_obj("root", context["root"]["type"])
	builder.build_obj(root, true)
	for key in context:
		if key == "root":
			continue
		var node = objects.create_obj(key, context[key]["type"])
		builder.build_obj(node, false)
	
#	Building BT
	var bt = dict["bt"]
	for id in (bt["nodes"] as Dictionary).keys() as Array[String]:
		var bt_node:Dictionary=bt["nodes"][id]
		var node = bt_nodes.create_bt_node(bt_node["name"])
		builder.add_bt_node(id, node)
	builder.build_bt_branch("", bt["root"])
	for edge in (bt["edges"] as Dictionary).values() as Array[Dictionary]:
		print("edge", edge["source"], "=====", edge["target"])
		builder.build_bt_branch(edge["source"], edge["target"])
	
	exporter.export(builder.build, "./test.tscn")
