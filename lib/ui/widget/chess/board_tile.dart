import 'package:dart_chess_pieces/dart_chess_pieces.dart';
import 'package:flutter/material.dart';


class BoardTile extends StatelessWidget {
  final int index;
  final ChessPiece? piece;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isPossibleMove;
  final int row; // crossAxisCount를 받아옴
  final int col;

  const BoardTile({
    required this.index,
    this.piece,
    required this.onTap,
    required this.row, 
    required this.col, 
    this.isSelected = false,
    this.isPossibleMove = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final isWhiteTile = (row+col) % 2 == 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected
            ? Colors.blueAccent.withOpacity(0.5)
            : isPossibleMove
            ? Colors.greenAccent.withOpacity(0.5)
            : isWhiteTile
            ? const Color.fromARGB(255, 59, 44, 44)
            : const Color.fromARGB(255, 106, 81, 81),
        child: Center(
          child: piece != null
          ? Icon(
            piece!.getIcon(),
            size: 36,
            color: piece!.isWhite ? Colors.white : Colors.black,
          )
          : null
        ),
      ),
    );
  }
}