import 'package:flutter/material.dart';
import 'package:testnet/models/job.dart';

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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        Text(data.tags,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              data.description,
              style: TextStyle(fontSize: 14, height: 1.15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('Edit Job Details'),
                  onPressed: () {},
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
