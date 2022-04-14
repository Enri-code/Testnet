import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testnet/domain/data.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/models/job.dart';
import 'package:testnet/providers/user.dart';
import 'package:testnet/view/widgets/active_job.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';
import 'package:testnet/view/widgets/load_error.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                            children: [
                              const Text(
                                'Welcome',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(Provider.of<UserProvider>(context)
                                  .user
                                  .firstName),
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
                                  jobLocation: 'New York, New York',
                                  location: 'Remote',
                                  jobType: 'Full-time',
                                  description:
                                      'We are looking for someone to assist the human resources team in the recruiting and hiring process, implement policies and strategies to improve productivity and efficiency levels and building an enjoyable company culture',
                                  creationDate: '10 days ago',
                                  image: AssetImage(
                                      'assets/images/errand_logo.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(26, 0),
                          child: IconButton(
                            icon: const RotatedBox(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: _ApplicantsSection(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicantsSection extends StatefulWidget {
  const _ApplicantsSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  State<_ApplicantsSection> createState() => _ApplicantsSectionState();
}

class _ApplicantsSectionState extends State<_ApplicantsSection> {
  Future<List<Applicant>>? data;
  var loading = false;

  @override
  void initState() {
    data = DataApi.getApplicants(1);
    loading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                widget.controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut);
              },
            ),
          ],
        ),
        FutureBuilder(
            future: data,
            builder: (_, AsyncSnapshot<List<Applicant>> shot) {
              if (shot.hasData) {
                loading = false;
                return Column(
                  children: List.generate(
                    shot.data!.length,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ApplicantTile(shot.data![i]),
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  LoadStateWidget(
                    shot.hasError,
                    onReload: () {
                      setState(() {
                        data = DataApi.getApplicants(1);
                      });
                    },
                  ),
                  SizedBox(height: 100),
                ],
              );
            }),
      ],
    );
  }
}
