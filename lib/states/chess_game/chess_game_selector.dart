import 'package:dart_chess_pieces/chess_board/chess_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/states/chess_game/chess_game_bloc.dart';
import 'package:flutter_chess/states/chess_game/chess_game_state.dart';

class ChessGameSelector<T> extends BlocSelector<ChessGameBloc, ChessGameState, T>{
  ChessGameSelector({
    required T Function(ChessGameState) selector,
    required Widget Function(T) builder,
  }): super(
    selector: selector,
    builder: (_, value) => builder(value)
  );
}

class ChessGameModeSelector extends ChessGameSelector<GameModeState>{
  ChessGameModeSelector(Widget Function(GameModeState) builder)
  : super(
    selector: (state) => state.gameMode,
    builder: builder
  );
}

class ChessGameStateBuilderSelector extends ChessGameSelector<ChessGameState>{
  ChessGameStateBuilderSelector(Widget Function(ChessGameState) builder)
      : super(
      selector: (state) => state,
      builder: builder
  );
}