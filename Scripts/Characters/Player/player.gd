extends CharacterBody3D

@export_category("Required Nodes")
@export var sprite_node: AnimatedSprite3D = null

@export_category("Movement Variables")
@export var move_speed: float = 5.0
@export var acceleration: float = 20.0
@export var deceleration: float = 50.0


func _physics_process(delta: float) -> void:
    var input_vector: Vector2 = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")

    if input_vector != Vector2.ZERO:
        velocity = velocity.move_toward(Vector3(input_vector.x, 0.0, input_vector.y) * move_speed, acceleration * delta)
        if sprite_node.animation != "run":
            sprite_node.animation = "run"
        # Flip sprite on H plane
        if input_vector.x < 0.0:
            sprite_node.flip_h = true
        elif input_vector.x > 0.0:
            sprite_node.flip_h = false
    else:
        velocity = velocity.move_toward(Vector3.ZERO, deceleration * delta)
        if (sprite_node.animation != "idle"):
            sprite_node.animation = "idle"

    move_and_slide()