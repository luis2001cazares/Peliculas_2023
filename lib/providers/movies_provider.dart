import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_2023/models/movie.dart';
import 'package:peliculas_2023/models/now_playing_response.dart';
import 'package:peliculas_2023/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier{
String _baseUrl = 'api.themoviedb.org';
String _apikey = '9dc27117b000e7e5acfb365fa957971a';
String _language = 'es-MX';

List<Movie>onDisplayMovies = [];
List<Movie>popularMovies = [];

MoviesProvider(){
  getOnDisplayMovies();
  getPopularMovies();
}

getOnDisplayMovies() async{
 var url= Uri.https(_baseUrl, '3/movie/now_playing',
 {'api_key': _apikey,'language': _language,'page':'1'});// aqui segun lo que utilize la api https o http

final response = await http.get(url);
final Map<String, dynamic> decodeData = json.decode(response.body);
// print(decodeData);
// print(response.body);
final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
 onDisplayMovies = nowPlayingResponse.results;
 notifyListeners();//le comunicamos a todos los widgets que están escuchando que se cambió la data por lo tanto se tienen que redibujar
 print(nowPlayingResponse.results[0].title);
}

getPopularMovies() async{
  var url=Uri.https(_baseUrl, '3/movie/popular',
  {'api_key': _apikey,'language':_language,'page':'1'});
  
  final response= await http.get(url);
  final popularResponse = PopularResponse.fromRawJson(response.body);

  //Destructurar resultado para cambiar página y mantener los actuales
  popularMovies = [...popularMovies,...popularResponse.results];
  notifyListeners();
}

}