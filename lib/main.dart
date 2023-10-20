// main.dart
import 'package:flutter/material.dart';
import 'package:peliculas_2023/models/models.dart';
import 'package:peliculas_2023/providers/movies_provider.dart';
import 'package:peliculas_2023/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (context) {
          final movie = ModalRoute.of(context)?.settings.arguments as Movie;
          return DetailsScreen(movie: movie);
        },
      },
    );
  }
}

