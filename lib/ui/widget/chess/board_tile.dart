import 'package:dart_chess_pieces/dart_chess_pieces.dart';
import 'package:flutter/cupertino.dart';
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
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.withOpacity(0.5)
              : isWhiteTile
              ? const Color.fromARGB(255, 106, 81, 81)
              : const Color.fromARGB(255, 104, 68, 68),
          border: Border.all(
            color: Colors.black, // 테두리 색상 설정
            width: 1.0, // 테두리 두께 설정
          ),
        ),
        child: boardTileIcon(piece, isPossibleMove)
      ),
    );
  }

  Widget boardTileIcon(ChessPiece? piece, bool isPossibleMove){
    return Center(
      child: Stack(
        alignment: Alignment.center, // Stack 내부의 아이콘들을 중앙에 위치시킵니다.
        children: [
          if (piece != null)
            Icon(
              piece.getIcon(),
              size: 36,
              color: piece.isWhite ? Colors.white : Colors.black,
            ),
          if (isPossibleMove)
            Icon(
              CupertinoIcons.circle_fill,
              color: Colors.blueAccent.withOpacity(0.5),
              size: 24,
            ),
        ],
      ),
    );
  }
}