@tool
class_name ChimeraExporter
extends Node


func export(node:Node, path:String):
	print("EXPORT")
	var scene:=PackedScene.new()
	scene.pack(node)
	ResourceSaver.save(scene, path)
