// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../shared/core/app_api.dart';
import '../models/cep_model.dart';

class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  Future<CEPModel> search(String cep) async {
    try {
      cep = cep.replaceAll("-", "");
      var response = await _dio.get('${AppApi.baseUrl}/ws/$cep/json/');
      return CEPModel.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
