import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const CustomNetworkImage(
      {Key? key,required this.imageUrl,this.fit,
        this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
    );
  }
}

ClipRRect buildImage({required String imageUrl,
  BoxFit? fit,double? width,double? height}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        color: Colors.grey.shade300,
        width: width,height: height,
        imageBuilder: (context, imageProvider) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: imageProvider,
                fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8,
                offset: const Offset(2, 5), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage(ImageConstants.placeholder),
                fit: BoxFit.cover
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              image: AssetImage(ImageConstants.noImage),
                fit: BoxFit.cover
            ),
          ),
        ),
      ),
  );
}