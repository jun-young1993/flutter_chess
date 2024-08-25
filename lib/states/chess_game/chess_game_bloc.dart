import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/repositories/chess_game_repository.dart';
import 'package:flutter_chess/states/chess_game/chess_game_event.dart';
import 'package:flutter_chess/states/chess_game/chess_game_state.dart';

class ChessGameBloc extends Bloc<ChessGameEvent,ChessGameState>{
  final ChessGameRepository _chessGameRepository;
  ChessGameBloc(this._chessGameRepository)
      : super(ChessGameState.initialize())
  {
    on(_onSelectedChessMode);
  }

  void _onSelectedChessMode(
      ChessGameModeSelected event,
      Emitter<ChessGameState> emit
  ){
    try{
      print('start bloc');
      print(state.asSelectedGameMode(event.gameMode));
      emit(state.asSelectedGameMode(event.gameMode));
      print(event.gameMode);
      print('end bloc');
    } on Exception catch(error){
      print(error);
      emit(state.asException(error));
    }
  }
}