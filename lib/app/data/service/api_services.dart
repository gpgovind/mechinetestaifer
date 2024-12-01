import 'package:aifertest/app/data/model/home_data_model/get_image_model.dart';
import 'package:aifertest/app/util/api_util.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "")
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiUrl.getImage)
  Future<List<GetUnplashImageModel>> getImages({
    @Query('page') required int page,
    @Query('content_filter') required String contentFilter,
    @Query('client_id') required String clientId,
  });
}
