import 'package:orange_interview/models/actor_model.dart';
import 'package:orange_interview/models/movie_dates_model.dart';

class MovieProfile
{

  num? id;
  String? name;
  String? imageUrl;
  num? rating;
  num? duration;
  String? overView;
  String? genres;
  bool? adult;
  bool? deleted;
  List<Actor> casts = [];
  List<MovieDate> movieDates = [];

  MovieProfile.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    imageUrl = map['imageUrl'];
    rating = map['rating'];
    duration = map['duration'];
    overView = map['overview'];
    genres = map['genres'];
    adult = map['adult'];
    deleted = map['deleted'];
    map['casts'] != null ? map['casts'].forEach((actor){
      casts.add(Actor.fromJson(actor));
    }) : [];
    map['movieDates'] != null ? map['movieDates'].forEach((movieDate){
      movieDates.add(MovieDate.fromJson(movieDate));
    }) : [];

  }

}
/*
"id": 58,
"name": "Piggy",
"imageUrl": "https://image.tmdb.org/t/p/w185/pIFeu5gF7ofAxI9NqrWbJAjjKn6.jpg",
"rating": 7,
"duration": 125,
"overview": "A bullied overweight teenager sees a glimpse of hope when her tormentors are brutally abducted by a mesmerizing stranger.",
"genres": "Action | Adventure",
"adult": false,
"deleted": false,

"casts": [
    {
      "actorId": 2188,
      "actorName": "Dwayne Johnson",
      "imageUrl": "https://image.tmdb.org/t/p/w185/cgoy7t5Ve075naBPcewZrc08qGw.jpg",
      "movieId": 58
    },
  ]
 */
