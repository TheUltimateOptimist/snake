import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/game_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Snake'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GameBoard _gameBoard = GameBoard();
  Timer? t;

  @override
  void initState() {
    t = Timer.periodic(
        const Duration(
          milliseconds: 50,
        ), (timer) {
      if (mounted) {
        setState(() {
          _gameBoard.move();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (keyEvent) {
        if (!keyEvent.isKeyPressed(keyEvent.logicalKey)) {
          return;
        }
        try {
          _gameBoard.direction =
              DirectionFactory.fromKeyLabel(keyEvent.logicalKey.keyLabel);
        } catch (e) {
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            color: Colors.green,
            height: _gameBoard.height.toDouble(),
            width: _gameBoard.width.toDouble(),
            child: Stack(
              children: [
                Positioned(
                  left: _gameBoard.leftDistance.toDouble(),
                  bottom: _gameBoard.bottomDistance.toDouble(),
                  child: Container(
                    color: Colors.black,
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
