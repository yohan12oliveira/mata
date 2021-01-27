import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';

import 'formiga.dart';

class Explosion extends AnimationComponent {
  static const TIME = 0.75;

  Explosion(Formiga formiga)
      : super.sequenced(40, 40, 'explosion-1.png', 7,
            textureWidth: 31.0, textureHeight: 31.0) {
    this.x = formiga.x;
    this.y = formiga.y;
    this.animation.stepTime = TIME / 7;
    Flame.audio.play('explosion.mp3');
  }

  @override
  bool destroy() {
    return this.animation.isLastFrame;
  }
}
