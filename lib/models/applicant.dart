import 'package:flutter/painting.dart';

class Applicant {
  const Applicant({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name, location = 'Ikeja, Lagos';
  final ImageProvider<Object>? image;

  factory Applicant.fromMap(Map<String, dynamic> map) {
    return Applicant(
      id: map['id'],
      name: map['first_name'] + ' ' + map['last_name'],
      image: map['avatar'] != null ? NetworkImage(map['avatar']) : null,
    );
  }
}

class ApplicantDetails extends Applicant {
  ApplicantDetails({
    required int id,
    required String name,
    required this.email,
    required ImageProvider<Object>? image,
  }) : super(id: id, name: name, image: image);

  String email;

  factory ApplicantDetails.fromApplicant(Applicant applicant) {
    return ApplicantDetails(
      id: applicant.id,
      name: applicant.name,
      image: applicant.image,
      email: '',
    );
  }

  factory ApplicantDetails.fromMap(Map<String, dynamic> map) {
    return ApplicantDetails(
      id: map['id'],
      name: map['first_name'] + ' ' + map['last_name'],
      image: map['avatar'] != null ? NetworkImage(map['avatar']) : null,
      email: map['email'],
    );
  }
}
