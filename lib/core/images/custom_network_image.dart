import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/images/cache_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.fit,
    required this.height,
    required this.width,
    this.color,
    this.placeholder,
    this.placeholderFit,
    this.alignment = Alignment.center,
    this.customPlaceHolder,
    this.name,
  });

  final String url;
  final BoxFit fit;
  final double height;
  final double width;
  final Color? color;
  final BoxFit? placeholderFit;
  final String? placeholder;
  final Alignment alignment;
  final Widget? customPlaceHolder;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: width,
      color: color,
      alignment: alignment,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      cacheManager: CustomCacheManager.instance,
      placeholder: (a, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? "assets/images/Ghau Rakshak.png",
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
    );
  }
}
