import 'package:flutter/material.dart';
import 'package:flutter_application_1/images_file/images_setting.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image(
        image: AssetImage(
          AppImages.moviePictireHeader,
        ),
      ),
      Positioned(
        top: 10,
        bottom: 20,
        child: Image(
          image: AssetImage(
            AppImages.moviePictireOverHeader,
          ),
        ),
      ),
    ]);
  }
}
// 412.185.39
// 96.92 145.39