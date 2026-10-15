extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	move(delta) # have move constantly process
	
func move(_delta: float) -> void:
		#Create input map for all axis movement (top down!)
	var direction: Vector2 = Input.get_vector("left", "right", "down", "up")
	
	velocity.x = direction * SPEED
	velocity.y = direction * SPEED
	move_and_slide()
