import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/states/chess_game/chess_game_bloc.dart';
import 'package:flutter_chess/states/chess_game/chess_game_selector.dart';
import 'package:flutter_chess/ui/screen/chess/chess_board_screen.dart';

class ChessScreen extends StatefulWidget {
  const ChessScreen({super.key});
  @override
  _ChessScreenState createState() => _ChessScreenState();
}

class _ChessScreenState extends State<ChessScreen>{
  ChessGameBloc get chessGameBloc => context.read<ChessGameBloc>();
  @override
  Widget build(BuildContext context){

      return Scaffold(
        appBar: AppBar(
            title: ChessGameModeSelector((selectedGameMode){
              return Text(selectedGameMode.name);
            })
        ),
        body: const Center(
            child: ChessBoardScreen()
        ),
      );

  }
}