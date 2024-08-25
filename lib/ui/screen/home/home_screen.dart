import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/main.dart';
import 'package:flutter_chess/routes.dart';
import 'package:flutter_chess/states/chess_game/chess_game_bloc.dart';
import 'package:flutter_chess/states/chess_game/chess_game_event.dart';
import 'package:flutter_chess/states/chess_game/chess_game_selector.dart';
import 'package:flutter_chess/states/chess_game/chess_game_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{

  ChessGameBloc get chessGameBloc => context.read<ChessGameBloc>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ChessGameModeSelector((selectedGameMode) {
                return DropdownButton(
                    items: GameModeState.values.map((GameModeState value){
                      return DropdownMenuItem<GameModeState>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    value: selectedGameMode,
                    onChanged: (gameMode) {
                      if(gameMode != null){
                        chessGameBloc.add(ChessGameModeSelected(gameMode: gameMode));
                      }
                    }
                );
              }),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.push(Routes.standard);
                },
                child: Text('START'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}