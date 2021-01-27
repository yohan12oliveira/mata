// https://flame-engine.org/docs/input.md

import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componentes/carro.dart';
import 'package:game_base/componentes/button_left.dart';
import 'package:game_base/componentes/button_rigth.dart';
import 'componentes/Bullet.dart';
import 'componentes/formiga.dart';
import 'package:flame/gestures.dart';
import 'package:game_base/componentes/fundo.dart';

const DRAGON_SIZE = 40.0;

var game;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll([
    'gramado.jpg',
    'formiga.png',
    'carro.png',
    'play-button_rigth.png',
    'play-button_left.png',
    'bullet.png',
    'explosion-1.png'
  ]);

  Flame.audio.load('explosion.mp3');
  var dimensions = await Flame.util.initialDimensions();

  game = JogoBase(dimensions);

  runApp(game.widget);
}

Formiga formiga;
Carro carro;
ButtonLeft buttonLeft;
ButtonRigth buttonRigth;
Fundo fundo;

bool isaAddNave = false;
bool isAddButton = false;
List<Formiga> dragonList;
var points = 0;

class JogoBase extends BaseGame with TapDetector {
  Size dimensions;
  Random random = new Random();

  JogoBase(this.dimensions) {
    carro = new Carro(dimensions);
    buttonLeft = new ButtonLeft(dimensions);
    buttonRigth = new ButtonRigth(dimensions);
    fundo = new Fundo(this.dimensions);
    dragonList = <Formiga>[];
    add(fundo);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (!isaAddNave) {
      add(carro);
      isaAddNave = true;
    }

    creationTimer += t;
    if (creationTimer >= 0.5) {
      creationTimer = 0.0;
      formiga = new Formiga(dimensions);
      dragonList.add(formiga);
      add(formiga);
    }

    print('Placar: $points');

    super.update(t);
  }

  void stopMoving() {
    carro.direction = 0;
  }

  void movingRight() {
    carro.direction = 1;
  }

  void movingLeft() {
    carro.direction = -1;
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    carro.direction = details.globalPosition.dx;
    tapInput(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void tapInput(Offset position) {
    Bullet bullet = new Bullet(dragonList, position);
    add(bullet);
  }
}
