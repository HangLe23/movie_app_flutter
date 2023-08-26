import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/api.dart';
import 'package:shimmer/shimmer.dart';

import 'default_avatar_widgets.dart';
import 'text_avatar.dart';

@immutable
class InternetImage extends StatelessWidget {
  const InternetImage({
    Key? key,
    required this.imageUrl,
    this.name,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  final String? name;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (Uri.parse('${AppConstants.imgPath}$imageUrl').isAbsolute) {
      return CachedNetworkImage(
        httpHeaders: const {
          'Access-Control-Allow-Origin': '*',
        },
        imageUrl: '${AppConstants.imgPath}$imageUrl',
        width: width,
        height: height,
        fit: fit,
        errorWidget: (context, url, error) => _UnsupportedImage(
          name: name,
          width: width,
          height: height,
        ),
        progressIndicatorBuilder: (
          context,
          url,
          progress,
        ) {
          return Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
            ),
          );
        },
      );
    } else {
      return _UnsupportedImage(
        name: name,
        width: width,
        height: height,
      );
    }
  }
}

class _UnsupportedImage extends StatelessWidget {
  const _UnsupportedImage({
    Key? key,
    required this.name,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String? name;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return name != null
        ? DefaultProfileAvatar(
            name: name!,
            shape: Shape.circular,
          )
        : Container(color: Colors.transparent);
  }
}
