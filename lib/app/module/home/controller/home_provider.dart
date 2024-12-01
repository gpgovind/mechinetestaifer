import 'package:aifertest/app/core/dio_handler/dio_handler.dart';
import 'package:aifertest/app/data/model/home_data_model/get_image_model.dart';
import 'package:aifertest/app/module/home/model/image_model.dart';
import 'package:aifertest/app/util/api_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_provider.g.dart';

final isblurProvider = StateProvider<Map<int, ImageModel>>((ref) => {});
final isLoadingMoreProvider = StateProvider<bool>((ref) => false);

@riverpod
class GetListImages extends _$GetListImages {
  @override
  Future<List<GetUnplashImageModel>> build({
    required int page,
  }) async {
    final client = await DioUtilAuthorized.createApiClient();
    final response = await client.getImages(
      contentFilter: 'high',
      clientId: ApiUrl.key,
      page: page,
    );
    return response;
  }
}
