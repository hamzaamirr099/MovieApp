import 'package:flutter/material.dart';

class ViewTicketScreen extends StatelessWidget {
  const ViewTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("View Ticket Screen"),
      ),
    );
  }
}
