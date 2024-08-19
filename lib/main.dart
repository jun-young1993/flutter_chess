import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/app.dart';
import 'package:flutter_chess/repositories/chess_game_repository.dart';
import 'package:flutter_chess/states/chess_game/chess_game_bloc.dart';

void main() {
  onError();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChessGameRepository>(
          create: (context) => ChessGameDefaultRepository()
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChessGameBloc(
              context.read<ChessGameRepository>()
            ),
          )
        ], 
        child: MyApp()
      )
    )
  );
}

void onError(){
  // global exception
  FlutterError.onError = (FlutterErrorDetails details) {
    print('[ERROR DETAILS]:');
    print(details.exceptionAsString());
  };
}
