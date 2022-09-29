extends Area2D
class_name PlayerTwo


signal point_player_two
var screen_size: Vector2
onready var sfx_collision: AudioStreamPlayer2D = $sfx_collision
onready var texture: AnimatedSprite = $texture
export(int) var speed


func _ready() -> void:
  screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
  var velocity: Vector2 = Vector2()
  
  if Input.is_action_pressed('ui_down'):
    velocity.y += 1
  elif Input.is_action_pressed('ui_up'):
    velocity.y -= 1
  
  if velocity.length() > 0:
    velocity = velocity.normalized() * speed
    texture.play()
  else:
    texture.stop()
    
  position += velocity * delta
  position.y = clamp(position.y, 0, screen_size.y)
  
  if velocity.y > 0:
    texture.animation = 'down'
  elif velocity.y < 0:
    texture.animation = 'up'
  

func _on_body_entered(body: Node) -> void:
  if body.name == 'Won':
    emit_signal('point_player_two')
  elif body.is_in_group('cars'):
    sfx_collision.play()
    
  position = Vector2(944, 696)
