import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componentes/Spaceship.dart';
import 'componentes/Dragon.dart';
import 'componentes/Smyle.dart';

var game;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(['smiley.png', 'dragon.png', 'spaceship.png']);
  var dimensions = await Flame.util.initialDimensions();
  game = JogoBase(dimensions);

  runApp(game.widget);
}

Smyle smyle;
Dragon dragon;
Spaceship spaceship;

class JogoBase extends BaseGame {
  Size dimensions;
  Random random = new Random();

  JogoBase(this.dimensions);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    //add(spaceship);

    creationTimer += t;
    if (creationTimer >= 0.5) {
      creationTimer = 0.0;
      int escolha = random.nextInt(2);
      print(escolha);
      if (escolha > 0) {
        smyle = new Smyle(dimensions);
        add(smyle);
      } else {
        dragon = new Dragon(dimensions);
        add(dragon);
      }
    }

    spaceship = new Spaceship(dimensions);
    add(spaceship);

    super.update(t);
  }

  void stopMoving() {
    spaceship.direction = 0;
  }

  void movingRight() {
    spaceship.direction = 1;
  }

  void movingLeft() {
    spaceship.direction = -1;
  }
}
