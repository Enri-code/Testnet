import 'dart:convert';

import 'package:http/http.dart';
import 'package:testnet/domain/urls.dart';
import 'package:testnet/models/applicant.dart';

abstract class DataApi {
  static Future<List<Applicant>> getApplicants(int page) async {
    final response = await get(
      AppUrls.apiWith('users'),
      headers: {'Content-Type': 'application/json'},
    );
    var list = json.decode(response.body)['data'] as List;
    var data = list.map((e) => Applicant.fromMap(e)).toList();
    return data;
  }

  static Future<ApplicantDetails> getApplicantDetails(int id) async {
    final response = await get(AppUrls.apiWith('users/$id'));

    return ApplicantDetails.fromMap(json.decode(response.body)['data']);
  }
}
