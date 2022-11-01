class MovieDate
{
  int? id;
  String? date;
  bool? deleted;
  int? movieId;

  MovieDate.fromJson(Map<String, dynamic> map)
  {
    id = map["id"];
    date = map["date"];
    deleted = map["deleted"];
    movieId = map["movieId"];
  }
}

/*
"id": 2609,
"date": "2022-10-29T23:30:00.000Z",
"deleted": false,
"movieId": 58
 */