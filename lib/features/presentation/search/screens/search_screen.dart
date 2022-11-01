import 'package:flutter/material.dart';
import 'package:orange_interview/core/widgets/default_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultFormField(
              hintText: "Search",
              prefixIcon: Icons.search,

            ),
          ],
        ),
      ),
    );
  }
}
