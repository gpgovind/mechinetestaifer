import 'dart:developer';
import 'dart:io';

import 'package:aifertest/app/data/model/home_data_model/get_image_model.dart';
import 'package:aifertest/app/module/home/model/image_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_provider.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  List<GetUnplashImageModel> images = [];

  Future<void> getImage(WidgetRef ref, int page) async {
    final data = await ref.read(getListImagesProvider(page: page).future);
    final newData = <GetUnplashImageModel>[];
    for (var element in data) {
      newData.add(element);
    }
    images.addAll(newData);
    notifyListeners();
  }

  Future<void> saveImageToGallery(String imageUrl, String filName,
      WidgetRef ref, int index, BuildContext context) async {
    try {
      ref.read(isblurProvider.notifier).update((state) {
        final updatedMap = Map<int, ImageModel>.from(state);
        updatedMap[index] = ImageModel(
          index: index,
          isDown: true,
          istaped: true,
        );
        return updatedMap;
      });

      if (await Permission.storage.request().isGranted) {
        final directory = await getTemporaryDirectory();
        final path = '${directory.path}/$filName.jpg';

        Dio dio = Dio();
        Response response = await dio.get(
          imageUrl,
          options: Options(responseType: ResponseType.bytes),
        );

        File file = File(path)..writeAsBytesSync(response.data);

        await Gal.putImage(file.path, album: 'MyAlbum');

        log("Image saved to gallery successfully.");

        await Future.delayed(const Duration(seconds: 2)).whenComplete(
          () {
            Fluttertoast.showToast(
                msg: "Image saved successfully!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        );

        ref.read(isblurProvider.notifier).update((state) {
          final updatedMap = Map<int, ImageModel>.from(state);
          updatedMap[index] = ImageModel(
            index: index,
            isDown: false,
            istaped: false,
          );
          return updatedMap;
        });
      } else {
        log("Permission denied.");
      }
    } catch (e) {
      log("Error saving image: $e");

      ref.read(isblurProvider.notifier).update((state) {
        final updatedMap = Map<int, ImageModel>.from(state);
        updatedMap[index] = ImageModel(
          index: index,
          isDown: false,
          istaped: false,
        );
        return updatedMap;
      });
    }
  }
}
