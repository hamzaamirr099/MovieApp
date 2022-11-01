import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_interview/core/widgets/default_button.dart';
import 'package:orange_interview/features/presentation/tickets/widgets/ticket_item.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => TicketItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 30,),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
Container(
        color: Colors.green,
        height: 130,
        child:
        Stack(
          children: [
            SvgPicture.asset('assets/images/ticket_background.svg',width: double.infinity, fit: BoxFit.fitWidth),
            Text("Ticket\n\n\n\kajdhka\naksjdhkjasdhk\nsdihaklTicket\n\n\n\kajdhka\naksjdhkjasdhk\nsdihakl\nhk"),

          ],
        ),
      )
 */
