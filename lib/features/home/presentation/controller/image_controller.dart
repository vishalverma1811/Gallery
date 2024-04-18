import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/core/usecases/app_exception.dart';
import 'package:gallery/features/home/data/model/image_model.dart';
import 'package:gallery/features/home/data/repo/image_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageController extends GetxController{
  final api = ImageRepo();
  final RxBool isImageLoading = false.obs;
  final RxBool isApiDone = false.obs;
  final image = Rxn<ImageModel>();
  RxList<Hits> images = <Hits>[].obs;

  void getAllImages() async{
    isImageLoading.value = true;
    isApiDone.value = true;

    api.getImage().then((value){
      isImageLoading.value = false;
      isApiDone.value = false;
      debugPrint("value after getWishlist Api hit $value");
      image.value = ImageModel.fromJson(value);
      images.value = image.value!.hits!;
    }).onError((error, stackTrace){
      isImageLoading.value = false;
      isApiDone.value = false;
      debugPrint("error while get all wishlist api hit ==> $error");
      if(error is InternetException){
        SnackBar(
          content: Text('No Internet, Please check your internet service!!'),
          duration: Duration(seconds: 3),
        );

      }
    });
  }
}