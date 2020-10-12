// https://flame-engine.org/docs/input.md

import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componentes/Spaceship.dart';
import 'package:game_base/componentes/button_left.dart';
import 'package:game_base/componentes/button_rigth.dart';
import 'componentes/Dragon.dart';
import 'componentes/Smyle.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';

var game;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll([
    'smiley.png',
    'dragon.png',
    'spaceship.png',
    'play-button_rigth.png',
    'play-button_left.png'
  ]);
  var dimensions = await Flame.util.initialDimensions();

  game = JogoBase(dimensions);

  runApp(game.widget);
}

Smyle smyle;
Dragon dragon;
Spaceship spaceship;
ButtonLeft buttonLeft;
ButtonRigth buttonRigth;

bool isaAddNave = false;
bool isAddButton = false;

class JogoBase extends BaseGame with TapDetector {
  Size dimensions;
  Random random = new Random();

  JogoBase(this.dimensions) {
    spaceship = new Spaceship(dimensions);
    buttonLeft = new ButtonLeft(dimensions);
    // buttonRigth = new ButtonRigth(dimensions);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (!isaAddNave) {
      add(spaceship);
      isaAddNave = true;
    }

    if (!isAddButton) {
      add(buttonLeft);
      //  add(buttonRigth);
      isAddButton = true;
    }

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

  void stopMoving() {
    spaceship.direction = 0;
  }

  void movingRight() {
    spaceship.direction = 1;
  }

  void movingLeft() {
    spaceship.direction = -1;
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    movingRight();
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    stopMoving();
  }
}
