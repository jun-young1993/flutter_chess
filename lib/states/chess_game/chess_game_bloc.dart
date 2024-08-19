import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/repositories/chess_game_repository.dart';
import 'package:flutter_chess/states/chess_game/chess_game_event.dart';
import 'package:flutter_chess/states/chess_game/chess_game_state.dart';

class ChessGameBloc extends Bloc<ChessGameEvent,ChessGameState>{
  final ChessGameRepository _chessGameRepository;
  ChessGameBloc(this._chessGameRepository) : super(ChessGameState.initialize());
}