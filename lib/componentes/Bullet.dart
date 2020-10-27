import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 30.0;
const SPEED = 150.0;

class Bullet extends SpriteComponent {
  bool explode = false;
  double direction = 0.0;
  Offset initialDirection;

  Bullet(this.initialDirection) : super.square(ComponentSize, 'bullet.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = size.height - 55;
  }
}
