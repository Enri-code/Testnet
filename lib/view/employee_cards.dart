import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testnet/domain/data.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';

class EmployeeCards extends StatefulWidget {
  const EmployeeCards(this.data, {Key? key}) : super(key: key);

  final Applicant data;

  @override
  State<EmployeeCards> createState() => _EmployeeCardsState();
}

class _EmployeeCardsState extends State<EmployeeCards> {
  late ApplicantDetails details;
  Animation<double>? pageAnim;

  @override
  void initState() {
    details = ApplicantDetails.fromApplicant(widget.data);
    DataApi.getApplicantDetails(details.id).then((value) {
      setState(() => details = value);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageAnim ??= ModalRoute.of(context)!.animation;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageAnim!,
      builder: (_, child) {
        var val = pageAnim!.value * 6;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: val, sigmaY: val),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, pageAnim!.value * .26),
            child: child,
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: () => Navigator.of(context).pop()),
          SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: pageAnim!, curve: Curves.easeOutBack)),
            child: Center(
              child: AspectRatio(
                aspectRatio: 327 / 492,
                child: ApplicantCard(details),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
