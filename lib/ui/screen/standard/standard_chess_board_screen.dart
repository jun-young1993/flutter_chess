import 'package:flutter/material.dart';
import 'package:flutter_chess/ui/widget/board_tile.dart';

class StandardChessBoardScreen extends StatefulWidget{
   const StandardChessBoardScreen({super.key});
   @override
  _StandardChessBoardScreenState createState() {
     return _StandardChessBoardScreenState();
   }
}

class _StandardChessBoardScreenState extends State<StandardChessBoardScreen> {
  final int crossAxisCount = 8;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          return Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1.0,
                ),
                itemCount: 64,
                itemBuilder: (context, index){
                  return BoardTile(
                    index: index,
                    onTap: (){

                    },
                    crossAxisCount: crossAxisCount,
                  );
                }
              )
            )
          );
        }
      )
    );
  }
}