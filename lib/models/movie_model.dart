class Movie {
  int? id;
  String? name;
  String? imageUrl;
  num? rating;
  num? duration;
  String? overView;
  String? genres;
  bool? adult;
  bool? deleted;

  Movie.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    imageUrl = map['imageUrl'];
    rating = map['rating'];
    duration = map['duration'];
    overView = map['overview'];
    genres = map['genres'];
    adult = map['adult'];
    deleted = map['deleted'];
  }
}

/*
"id": 56,
"name": "Blackout",
"imageUrl": "https://image.tmdb.org/t/p/w185/xDgnmbdWS59NtTPdzujdZGuPUPZ.jpg",
"rating": 6,
"duration": 111,
"overview": "A man wakes in a hospital with no memory, and quickly finds himself on the run in a locked down hospital with the Cartel on his tail.",
"genres": "Horror | Thriller",
"adult": false,
"deleted": false
 */
