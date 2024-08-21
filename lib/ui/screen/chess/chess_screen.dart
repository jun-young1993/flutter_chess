import 'package:flutter/material.dart';
import 'package:flutter_chess/ui/screen/standard/standard_chess_board_screen.dart';

class ChessScreen extends StatefulWidget {
  const ChessScreen({super.key});
  @override
  _ChessScreenState createState() => _ChessScreenState();
}


class _ChessScreenState extends State<ChessScreen>{
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