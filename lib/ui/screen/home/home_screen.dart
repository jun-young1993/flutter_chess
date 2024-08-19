import 'package:flutter/material.dart';
import 'package:flutter_chess/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: (){

              }, 
              child: Text("test")),
              ElevatedButton(
                onPressed: () {
                  print('press');
                  AppNavigator.push(Routes.standard);
                },
                child: Text('빠른 시작'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}