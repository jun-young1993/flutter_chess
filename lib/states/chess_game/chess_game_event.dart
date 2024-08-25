import 'package:flutter_chess/states/chess_game/chess_game_state.dart';

abstract class ChessGameEvent {
  const ChessGameEvent();
}

class ChessGameModeSelected extends ChessGameEvent{
  final GameModeState gameMode;
  const ChessGameModeSelected({
    required this.gameMode
  });
}