import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/pokemon_list/cubit/pokemon_cubit.dart';
import 'src/pokemon_list/screens/pokemon_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonCubit(),
      child: MaterialApp(
        title: 'Pokemon List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokemonListScreen(),
      ),
    );
  }
}
