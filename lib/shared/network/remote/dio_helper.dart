import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://softagic.wwwnl1-ss19.a2hosted.com/',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    path,
    data,
    token,
    query,
  }) async {
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }

    return await dio.post(
      path,
      data: data ?? null,
      queryParameters: query ?? null,
    );
  }
  static Future<Response> postNotification({path, data}) async
  {
    dio.options.baseUrl = 'https://fcm.googleapis.com/';

    dio.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization' : 'key=AAAAczKqNp8:APA91bGmbFxy_0h1TS1EnJfrQ54yo32PtVz-desjlYNcekmXrvY3KWXLjEgn5drsbNq55oxZ12ZCBnWw15Dm-bUWDKnQIIUT229cDO-W-fO8TUzxSIHqRsxRE4EAfKMHzuzYA-fqm8mU',
    };

    return await dio.post(
      path,
      data: data??null,
    );
  }
}
