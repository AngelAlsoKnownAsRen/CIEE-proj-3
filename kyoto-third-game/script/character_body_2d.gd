extends CharacterBody2D


@onready var character_sprite = $AnimatedSprite
@onready var actionable_presence = $Actionable_Presence/Actionable_Area
@export var SPEED = 250
var heading = Vector2.RIGHT
var moving: bool = false

func _physics_process(delta: float) -> void:
	move(delta) # have move constantly process
	move_and_slide()
	set_heading()
	anim_check()
	interact()
	
func move(_delta: float) -> void:
	if State.convo_complete == true:
			#Create input map for all axis movement (top down!)
		var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		if velocity.x or velocity.y != 0:
			moving = true
		else:
			moving = false
#Have the sprite flip horizontally depending on movement direction
func set_heading() -> void:
	if velocity.x > 0:
		#Labeling of current Direction
		heading = Vector2.RIGHT
		character_sprite.flip_h = false
	elif velocity.x < 0:
		heading = Vector2.LEFT
		character_sprite.flip_h = true
		
func anim_check() -> void:
	if moving == true:
		character_sprite.play("Walk")
	if moving == false:
		character_sprite.play("Idle")

func interact() -> void:
	if State.convo_complete == true:
		if Input.is_action_just_pressed("menu_action"):
			var actionables = actionable_presence.get_overlapping_areas()
			if actionables.size() > 0:
				actionables[0].action()
				return
