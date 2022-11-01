import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orange_interview/models/movie_dates_model.dart';

class DateButton extends StatelessWidget {
  final MovieDate movieDate;

  const DateButton({Key? key, required this.movieDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat.MMMd().format(DateTime.parse(movieDate.date!));
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        onPressed: () {
          //movieDate.id this will be sent to the api

        },
        color: Colors.red,
        child: Text(
          date,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
