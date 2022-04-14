import 'package:flutter/painting.dart';

class Applicant {
  const Applicant({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
  });

  final int id;
  final String name, location;
  final ImageProvider<Object> image;
}

class ApplicantDetails extends Applicant {
  const ApplicantDetails({
    required int id,
    required String name,
    required String location,
    required this.email,
    required ImageProvider<Object> image,
  }) : super(id: id, name: name, location: location, image: image);
  final String email;
}
