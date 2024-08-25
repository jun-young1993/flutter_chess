import 'package:dart_chess_pieces/chess_board/chess_board.dart';
import 'package:dart_chess_pieces/dart_chess_pieces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess/states/chess_game/chess_game_selector.dart';
import 'package:flutter_chess/ui/screen/chess/chess_grid.dart';
import 'package:flutter_chess/ui/widget/chess/board_tile.dart';


class ChessBoardScreen extends StatefulWidget{
   const ChessBoardScreen({super.key});
   @override
  _ChessBoardScreen createState() {
     return _ChessBoardScreen();
   }
}

class _ChessBoardScreen extends State<ChessBoardScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ChessGameStateBuilderSelector((state) {
        final ChessBoard board = state.board;
        board.onCheck = (ChessPiece piece) {
          print('Check from game state! ${piece}');
        };
        board.onCheckMate = (){
          print('CheckMate');
        };


        return ChessGrid(
          itemCount: board.board.length * board.board[0].length,
          crossAxisCount: board.board[0].length,
          itemBuilder: (context, index, row, col){
            ChessPiece? piece = board.getPiece(row, col);
            return BoardTile(
              piece: piece,
              index: index,
              row: row,
              col: col,
              isSelected: board.isSameAsPosition(row,col),
              isPossibleMove: board.isPossiblePosition(row,col),
              onTap: (){
                setState((){
                  if(board.isSelected()){
                    if(board.isPossiblePosition(row,col)) {
                      board.move(Position(row, col));
                    }
                    board.unSelect();
                  }else{
                    board.select(row, col);
                  }
                });
              },
            );
          },
        );
      })
    );
  }
}