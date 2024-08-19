import 'package:flutter/material.dart';
import 'package:flutter_chess/ui/screen/standard/standard_chess_board_screen.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({super.key});
  @override
  _StandardScreenState createState() => _StandardScreenState();
}


class _StandardScreenState extends State<StandardScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Standard')
      ),
      body: const Center(
        child: StandardChessBoardScreen()
      ),
    );
  }
}