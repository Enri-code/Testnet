import 'package:flutter/painting.dart';

class Job {
  const Job({
    required this.name,
    required this.rate,
    required this.description,
    required this.location,
    required this.jobType,
    required this.jobLocation,
    required this.creationDate,
    required this.image,
  });
  final String name,
      rate,
      location,
      jobType,
      jobLocation,
      description,
      creationDate;
  final ImageProvider<Object> image;
}
