extends Node2D

var direction = Vector2(1,1)
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Icon.position += direction * speed
	
	if($Icon.position.x >= 1152):
		direction.x = -1
	elif($Icon.position.x <= 0):
		direction.x = 1
	if($Icon.position.y >= 648):
		direction.y = -1
	elif($Icon.position.y <= 0):
		direction.y = 1
	pass
