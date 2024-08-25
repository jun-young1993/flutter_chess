import 'package:dart_chess_pieces/chess_board/chess_board.dart';
import 'package:dart_chess_pieces/dart_chess_pieces.dart';
import 'package:flutter/foundation.dart';

enum GameModeState {
  standard,
  double
}

class ChessGameState {
  final GameModeState gameMode;
  final Exception? error;
  final ChessBoard board;

  // const 제거하고 기본 생성자로 변경
  ChessGameState._({
    this.gameMode = GameModeState.standard,
    ChessBoard? board,
    this.error,
  }) : board = board ?? StandardChessBoard(); // board를 null 체크 후 초기화

  ChessGameState.initialize() : this._();

  ChessGameState asSelectedGameMode(GameModeState gameMode) {
    ChessBoard newBoard;
    switch(gameMode){
      case GameModeState.double:
        newBoard = DoubleChessBoard(); // 예시로 동일한 보드 사용
        break;
      default:
        newBoard = StandardChessBoard();
    }
    return copyWith(gameMode: gameMode, board: newBoard);
  }

  ChessGameState asException(Exception error) {
    return copyWith(error: error);
  }

  ChessGameState copyWith({
    GameModeState? gameMode,
    Exception? error,
    ChessBoard? board, // board를 copyWith에서 처리할 수 있도록 추가
  }) {
    return ChessGameState._(
      gameMode: gameMode ?? this.gameMode,
      error: error ?? this.error,
      board: board ?? this.board, // board를 복사
    );
  }
}