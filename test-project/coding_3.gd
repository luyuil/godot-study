extends Node2D

var dir_flag:int = 0 # 0是向右走，1是向左走

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.position.x = 64
	$Sprite2D.position.y = 150
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if($Sprite2D.position.x < 1086 and dir_flag == 0):
		$Sprite2D.position.x += 4
		if($Sprite2D.position.x >= 1086):
			dir_flag = !dir_flag
	elif($Sprite2D.position.x >= 64 and dir_flag == 1):
		$Sprite2D.position.x -= 4
		if($Sprite2D.position.x <= 64):
			dir_flag = !dir_flag
	pass
