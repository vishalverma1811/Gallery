import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/features/home/data/model/image_model.dart';
import 'package:gallery/features/home/presentation/widgets/image_in_full.dart';
import 'package:get/get.dart';

class ImageCard extends StatelessWidget {
  final Hits hit;

  const ImageCard({super.key, required this.hit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(transition: Transition.leftToRightWithFade,
            duration: const Duration(milliseconds: 400),
            ImageInFull(imageUrl: hit.largeImageURL!, hit: hit,));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0,2),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: hit.imageWidth! / hit.imageHeight!,
            child: Image.network(
              hit.webformatURL!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}