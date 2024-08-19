import 'package:flutter/material.dart';


class BoardTile extends StatelessWidget {
  final int index;
  // final Piece? piece;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isPossibleMove;
  final int crossAxisCount; // crossAxisCount를 받아옴

  const BoardTile({
    required this.index,
    // required this.piece,
    required this.onTap,
    required this.crossAxisCount, // crossAxisCount를 초기화
    this.isSelected = false,
    this.isPossibleMove = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isEvenRow = (index ~/ crossAxisCount) % 2 == 0;
    final isEvenTile = (index % 2 == 0);
    final isWhiteTile = (isEvenRow && isEvenTile) || (!isEvenRow && !isEvenTile);

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
          child: Text('piece')
        ),
      ),
    );
  }
}