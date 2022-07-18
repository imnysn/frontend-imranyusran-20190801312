import 'package:dio/dio.dart';
import 'package:uas/model/dosen.dart';
import 'package:uas/model/dosen_response.dart';

import '../../utils/dio_response.dart';

abstract class DosenRepository {
  Future<DioResponse<List<Dosen>>> getListDosen();
  Future<DioResponse<String>> addDosen(Dosen dosen);
  Future<DioResponse<String>> updateDosen(Dosen dosen);
  Future<DioResponse<String>> deleteDosen(int id);
}

class DosenRepositoryImpl implements DosenRepository {
  @override
  Future<DioResponse<String>> addDosen(Dosen dosen) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      Response response =
          await _dio().post('/lecturerData', data: dosen.toJson1());
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> deleteDosen(int id) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      var response = await _dio().delete('/lecturerData/$id');
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<List<Dosen>>> getListDosen() async {
    DioResponse<List<Dosen>> dioResponse = DioResponse();
    try {
      var response = await _dio().get('/lecturerData');
      var dosenResponse = DosenResponse.fromJson(response.data);
      dioResponse.data = dosenResponse.data;
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> updateDosen(Dosen dosen) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      var response = await _dio()
          .put('/lecturerData/${dosen.id}}', data: dosen.toJson1());
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }
}

Dio _dio() {
  var options = BaseOptions(
      baseUrl: 'http://192.168.100.236:8000/api',
      connectTimeout: 5000,
      receiveTimeout: 10000,
      contentType: 'application/json',
      responseType: ResponseType.json);
  return Dio(options);
}
