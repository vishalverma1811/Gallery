import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/features/home/presentation/controller/image_controller.dart';
import 'package:gallery/features/home/presentation/widgets/image_card.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImageController imageController = Get.put(ImageController());

  @override
  void initState() {
    // TODO: implement initState
    imageController.getAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    int crossAxisCount = (screenWidth / 180).floor();
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: Obx(
            () {
          if (imageController.images.isEmpty) {
            return GridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(
                imageController.images.length,
                    (index) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return GridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(
                imageController.images.length,
                    (index) => ImageCard(
                  hit: imageController.images[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
