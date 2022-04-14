import 'package:flutter/material.dart';
import 'package:testnet/models/job.dart';
import 'package:testnet/view/edit_job.dart';

class ActiveJobCard extends StatelessWidget {
  const ActiveJobCard(this.data, {Key? key}) : super(key: key);
  final Job data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 8, 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(image: data.image),
                const SizedBox(width: 4),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${data.name}  -',
                              style: const TextStyle(
                                  fontSize: 18, color: Color(0xff222222)),
                            ),
                            Text(data.rate,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        Text(
                          [
                            if (data.jobLocation.isNotEmpty) data.jobLocation,
                            if (data.location.isNotEmpty) data.location,
                            if (data.jobType.isNotEmpty) data.jobType,
                          ].join(' | '),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              data.description,
              style: const TextStyle(fontSize: 14, height: 1.15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('Edit Job Details'),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(EditJobScreen.route, arguments: data);
                  },
                ),
                Text(
                  'Created ${data.creationDate}',
                  style: const TextStyle(fontSize: 13, height: 1.1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
