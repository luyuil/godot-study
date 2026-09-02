extends Area2D

var direction = Vector2.LEFT
var speed = 150
var colors = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png"),
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if position.x < 0:
		direction.x = 1
		$Sprite2D.flip_h = true 
	$Sprite2D.texture = colors.pick_random()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# 这里为什么使用_process，而不是_physics_process，因为设定车辆碰到玩家即结束游戏，不需要进行物理碰撞检测
func _process(delta: float) -> void:
	position += direction * speed * delta
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
