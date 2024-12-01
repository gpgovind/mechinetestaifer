import 'dart:developer';

import 'package:aifertest/app/data/service/api_services.dart';
import 'package:aifertest/app/util/api_util.dart';
import 'package:dio/dio.dart';

class DioUtilAuthorized {
  DioUtilAuthorized._internal();

  static Future<ApiServices> createApiClient() async {
    String baseUrl = ApiUrl.baseURL;

    try {
      final dioClient = Dio(
        BaseOptions(
          contentType: "application/json",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 10000),
        ),
      );

      dioClient.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers['accept'] = "/";
        //    final token = await Storage.getValue(Storage.tokenId);

        // if (token != null) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }

        return handler.next(options);
      }, onError: (error, handler) async {
        log("Error creating Dio client: $error");
        handler.next(error);
      }));

      final client = ApiServices(dioClient, baseUrl: baseUrl);
      return client;
    } catch (error) {
      log("Error creating Dio client: $error");
      rethrow;
    }
  }
}
