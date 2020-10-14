import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Dragon.dart';

const ComponentSize = 30.0;
const SPEED = 150.0;

class Bullet extends SpriteComponent {
  bool explode = false;
  double direction = 0.0;
  Offset initialDirection;
  // List<Dragon> dragonList = <Dragon>[];
  // List<Bullet> bulletList = <Bullet>[];

  Bullet(this.initialDirection) : super.square(ComponentSize, 'bullet.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;

/*
    if (dragonList.isNotEmpty)
      dragonList.forEach((dragon) {
        bool remove = this.toRect().contains(dragon.toRect().bottomCenter) ||
            this.toRect().contains(dragon.toRect().bottomLeft) ||
            this.toRect().contains(dragon.toRect().bottomRight);
        if (remove) {
          this.explode = true;
          dragonList.remove(dragon);
        }
      });
      */
  }

  @override
  bool destroy() {
    /*
    if (explode) {
      return true;
    }
    if (y == null || 0 == null) {
      return false;
    }
    bool destroy = y >= 0;

    return destroy;
    */
    return false;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = size.height - 55;
  }
}
