import 'package:flutter/material.dart';

typedef ChessGridItemBuilder = Widget Function(BuildContext context, int index, int row, int col);
class ChessGrid extends StatelessWidget {
  final int crossAxisCount;
  final ChessGridItemBuilder itemBuilder;

  const ChessGrid({
    super.key, 
    required this.crossAxisCount,
    required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1.0,
              ),
              itemCount: 64,
              itemBuilder: (context, index) {
                // 각 셀의 2차원 배열 위치를 출력
                return itemBuilder(context,index,index ~/ crossAxisCount,index % crossAxisCount);
              },
            ),
          ),
        );
      },
    );
  }
}
