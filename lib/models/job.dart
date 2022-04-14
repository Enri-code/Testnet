import 'package:flutter/painting.dart';

class Job {
  const Job({
    required this.name,
    required this.rate,
    required this.tags,
    required this.description,
    required this.creationDate,
    required this.image,
  });
  final String name, rate, tags, description, creationDate;
  final ImageProvider<Object> image;
}
