import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingImageData {
  final String image;
  final String title;
  final String info;

  OnBoardingImageData(this.image, this.title, this.info);
}

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OnBoardingImageData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images
        Expanded(
          child: SvgPicture.asset(
            data.image,
            fit: BoxFit.contain,
          ),
        ),
        // title
        const SizedBox(height: 32),
        Text(
          data.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        // info
        const SizedBox(height: 8),
        Text(
          data.info,
          style: const TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
