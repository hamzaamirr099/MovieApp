class UpcomingMovie {
  String? name;
  String? imageUrl;
  String? overView;
  num? rating;
  String? trailer;
  num? duration;
  bool? adult;
  String? genre;

  UpcomingMovie.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    imageUrl = map['imageUrl'];
    rating = map['rating'];
    duration = map['duration'];
    overView = map['overview'];
    trailer = map['trailer'];
    genre = map['genre'];
    adult = map['adult'];
  }
}

/*
"name": "Terrifier 2",
"imageUrl": "https://image.tmdb.org/t/p/w500/yw8NQyvbeNXoZO6v4SEXrgQ27Ll.jpg",
"overview": "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
"rating": 7.5,
"trailer": "https://youtube.com/watch?v=x5DhuDSArTI",
"duration": 138,
"adult": false,
"genre": "Horror, Thriller"
 */
