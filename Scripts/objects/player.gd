extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_component: GravityComponent
@export var controls_component: ControlsComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var gravity_toggle_component: GravityToggleComponent
@export var sounds_component: SoundsComponent

func _physics_process(delta: float) -> void:
	
	gravity_component.handle_gravity(self, delta, gravity_component.get_grounded_status(self, gravity_component.gravity_vector_y))
	
	movement_component.handle_horizontal_movement(self, controls_component.input_horizontal)
	
	animation_component.handle_move_animation(controls_component.input_horizontal, gravity_component.is_falling, gravity_toggle_component.just_toggled)
	
	animation_component.handle_gravity_toggle_animation(gravity_component.gravity_vector_y)
	
	gravity_toggle_component.handle_gravity_toggle(controls_component.get_gravity_input(), gravity_component.get_grounded_status(self, gravity_component.gravity_vector_y))
	
	
	
	move_and_slide()
