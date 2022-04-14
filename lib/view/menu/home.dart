import 'package:flutter/material.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/models/job.dart';
import 'package:testnet/view/widgets/active_job.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Welcome',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text('Errand360!'),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.notifications_none_rounded),
                        iconSize: 40,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Active Jobs',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('View All')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      AspectRatio(
                        aspectRatio: 32.5 / 20,
                        child: PageView(
                          pageSnapping: true,
                          children: const [
                            ActiveJobCard(
                              Job(
                                name: 'Operations Manager',
                                rate: r'$32.00/hr',
                                tags: 'New York, New York | Remote | Full-time',
                                description:
                                    'We are looking for someone to assist the human resources team in the recruiting and hiring process, implement policies and strategies to improve productivity and efficiency levels and building an enjoyable company culture',
                                creationDate: '10 days ago',
                                image:
                                    AssetImage('assets/images/errand_logo.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(26, 0),
                        child: IconButton(
                          icon: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(Icons.arrow_back_ios),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: const BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Applicants',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        child: const Text('View All'),
                        onPressed: () {
                          controller.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        },
                      ),
                    ],
                  ),
                  ...List.generate(
                    1,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ApplicantTile(
                        Applicant(
                            id: 0,
                            image: AssetImage(''),
                            location: 'New Jersey',
                            name: 'Eric Oneyrulo'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
