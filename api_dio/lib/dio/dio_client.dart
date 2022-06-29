import 'package:dio/dio.dart';

import '../model/user.dart';

class DioClient {
  final Dio dio = Dio();

  final base_url = 'https://reqres.in/api';

  Future<User?> getUser({String? id}) async {
    User? user;
    try {
      // final DioClient _dio = DioClient();
      Response userData = await dio.get(base_url + '/user/$id');

      print('User Info: ${userData.data}');
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('Status : ${e.response?.statusCode}');
        print('Data: ${e.response?.data}');
        print('Headers: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
