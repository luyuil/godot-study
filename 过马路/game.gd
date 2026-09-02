extends Node2D

# 预加载car场景
var car_scene: PackedScene = preload("res://scenes/Car.tscn")
# 得分计时
var score: int = 0

func _on_finish_area_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")
	if score < Global.score:
		Global.score = score
	pass # Replace with function body.

func change_scene():
	get_tree().change_scene_to_file.call_deferred("res://scenes/title.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("beep")
	pass # Replace with function body.


func _on_car_timer_timeout() -> void:
	# 创建car场景实例
	var car = car_scene.instantiate() as Area2D
	
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	
	# 添加car场景实例
	$Objects.add_child(car)
	car.connect("body_entered",go_to_title)
	
	pass # Replace with function body.

func go_to_title(_body):
	call_deferred("change_scene")

func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = 'Time elapsed: ' + str(score)
	pass # Replace with function body.
