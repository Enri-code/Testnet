import 'package:flutter/material.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/theme/colors.dart';
import 'package:testnet/view/employee_cards.dart';

class ApplicantTile extends StatelessWidget {
  const ApplicantTile(this.data, {Key? key}) : super(key: key);

  final Applicant data;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkResponse(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 0, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: data.image != null
                          ? Image(image: data.image!, fit: BoxFit.cover)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                          Text(data.location),
                        ],
                      ),
                    ),
                    IconButton(
                      iconSize: 48,
                      color: ColorPalette.secondary,
                      icon: const Icon(Icons.play_arrow_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      child: const Text('View Profile'),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      child: const Text('See Details'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => EmployeeCards(data),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ApplicantCard extends StatelessWidget {
  const ApplicantCard(this.data, {Key? key}) : super(key: key);

  final ApplicantDetails data;

  static const _socials = [
        'Empathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      _professional = [
        'C/C++',
        'Java',
        'Javascript',
        'PHP',
        'Python',
        'Swift',
        'CSS',
        'HTML'
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: data.image != null
                        ? Image(image: data.image!, fit: BoxFit.cover)
                        : null,
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.email,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    iconSize: 32,
                    padding: EdgeInsets.zero,
                    color: ColorPalette.primary,
                    icon: const Icon(Icons.message_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Social skills',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      _socials.length,
                      (i) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: ColorPalette.secondary,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Text(
                            _socials[i],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Professional skills',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      _professional.length,
                      (i) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: ColorPalette.secondary,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Text(
                            _professional[i],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Education',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'University of Benin',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '3 more',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Bachelor of Business Administration',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Experience',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Boys & Girls Club',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '3 more',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Summer Youth Volunteer',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View full profile',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
