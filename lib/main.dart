import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'componentes/Dragon.dart';
import 'componentes/Smyle.dart';

var game;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(['smiley.png', 'dragon.png']);
  var dimensions = await Flame.util.initialDimensions();
  game = JogoBase(dimensions);

  runApp(game.widget);
}

Smyle smyle;
Dragon dragon;

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

    super.update(t);
  }
}
