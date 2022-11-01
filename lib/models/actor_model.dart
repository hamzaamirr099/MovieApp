class Actor
{
  int? actorId;
  String? actorName;
  String? imageUrl;
  int? movieId;

  Actor.fromJson(Map<String, dynamic> map) {
    actorId = map['actorId'];
    actorName = map['actorName'];
    imageUrl = map['imageUrl'];
    movieId = map['movieId'];
  }

}
/*
"casts": [
    {
      "actorId": 2188,
      "actorName": "Dwayne Johnson",
      "imageUrl": "https://image.tmdb.org/t/p/w185/cgoy7t5Ve075naBPcewZrc08qGw.jpg",
      "movieId": 58
    },
 */