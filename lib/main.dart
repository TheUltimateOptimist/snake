import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'game.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  Ticker? ticker;
  late Game game;


@override
  void initState() {
    game = Game();
    ticker = createTicker((elapsed) {
      if(game.canMoveForward()){
        game.moveForward(elapsed);
        return;
      }
      ticker?.stop();
      //TODO: implement end of game logic
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
          if(!ticker!.isActive){
            ticker!.start();
            return;
          }
          game.changeDirection(keyEvent.logicalKey.keyLabel);
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
            height: game.getBoardHeight().toDouble(),
            width: game.getBoardWidth().toDouble(),
            child: Stack(
              children: game.getContainers(),
            ),
          ),
        ),
      ),
    );
  }
}
