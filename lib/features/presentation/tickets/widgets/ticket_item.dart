import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_interview/features/presentation/tickets/screens/view_ticket_screen.dart';

import '../../../../core/widgets/default_button.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 200, /////////////////////////
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/ticket_background.svg',
              height: 200, //////////////////////////////
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/spiderman.png",
                          height: 155,
                          ////////////////////////////////////////temporarily solution
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spider man no way home",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.watch_later_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text("9:00 PM | 20 February",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.chair_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text("4 seats",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: DefaultButton(
                                buttonText: "View Ticket",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ViewTicketScreen()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
