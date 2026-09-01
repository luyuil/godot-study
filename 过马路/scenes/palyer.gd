extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var speed: int = 200

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	animation()
	move_and_slide()
	
	if Input.is_action_just_pressed("confirm"):
		print("start")

func animation():
	if direction != Vector2.ZERO:
		# 获取主要方向
		var anim_name: String
		if abs(direction.x) > abs(direction.y):
			anim_name = "right" if direction.x > 0 else "left"
		else:
			anim_name = "down" if direction.y > 0 else "up"
		$AnimatedSprite2D.play(anim_name)
	else:
		$AnimatedSprite2D.stop()
		
		# 一行代码搞定动画的反转效果（左右）
		#$AnimatedSprite2D.flip_h = direction.x > 0
		#if direction.x > 0:
			#$AnimatedSprite2D.flip_h = true
		#else:
			#$AnimatedSprite2D.flip_h = false
		pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
