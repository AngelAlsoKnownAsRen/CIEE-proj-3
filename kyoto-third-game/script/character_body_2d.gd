extends CharacterBody2D
@onready var idle = $Idle
@export var SPEED = 250

func _physics_process(delta: float) -> void:
	move(delta) # have move constantly process
	move_and_slide()
	
func move(_delta: float) -> void:
		#Create input map for all axis movement (top down!)
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
