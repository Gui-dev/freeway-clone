extends RigidBody2D
class_name Cars

onready var texture: AnimatedSprite = $texture


func _ready() -> void:
  var random_cars = texture.frames.get_animation_names()
  texture.animation = random_cars[randi() % random_cars.size()]


func _on_notifier_screen_exited() -> void:
  queue_free()
