import 'package:dart_chess_pieces/dart_chess_pieces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess/ui/screen/chess/chess_grid.dart';
import 'package:flutter_chess/ui/widget/chess/board_tile.dart';

class StandardChessBoardScreen extends StatefulWidget{
   const StandardChessBoardScreen({super.key});
   @override
  _StandardChessBoardScreenState createState() {
     return _StandardChessBoardScreenState();
   }
}

class _StandardChessBoardScreenState extends State<StandardChessBoardScreen> {
  final StandardChessBoard _board = StandardChessBoard();
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ChessGrid(
        crossAxisCount: 8,
        itemBuilder: (context, index, row, col){
          ChessPiece? piece = _board.getPiece(row, col);

          return BoardTile(
            piece: piece,
            index: index, 
            row: row,
            col: col,
            isSelected: _board.isSameAsPosition(row,col),
            isPossibleMove: _board.isPossiblePosition(row,col),
            onTap: (){
              setState((){
                if(_board.isSelected()){
                  if(_board.isPossiblePosition(row,col)){
                    _board.move(Position(row, col));
                  }else{
                    _board.unSelect();
                  }
                }else{
                  _board.select(row, col);
                }
              });
            
            }, 
            
          );
        },
      )
    );
  }
}