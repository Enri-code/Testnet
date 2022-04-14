import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';

class EmployeeCards extends StatefulWidget {
  const EmployeeCards({Key? key}) : super(key: key);

  @override
  State<EmployeeCards> createState() => _EmployeeCardsState();
}

class _EmployeeCardsState extends State<EmployeeCards> {
  late final PageController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var page = ModalRoute.of(context)!.settings.arguments as int;
    controller = PageController(initialPage: page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(onTap: () => Navigator.of(context).pop()),
            Center(
              child: SizedBox(
                height: 580,
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (_, i) => const Center(
                    child: AspectRatio(
                      aspectRatio: 327 / 492,
                      child: ApplicantCard(
                        ApplicantDetails(
                            id: 0,
                            image: AssetImage(''),
                            location: 'New Jersey',
                            name: 'Eric Oneyrulo',
                            email: 'exail@exaple.om'),
                      ),
                    ),
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
