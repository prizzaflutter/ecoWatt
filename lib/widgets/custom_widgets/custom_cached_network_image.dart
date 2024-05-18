import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
Widget cachedNetworkImage ({required String image,double? width, double? height , BoxShape? shape}){
  return  CachedNetworkImage(
    width: width ?? 100,
    height: height ?? 100,
    imageUrl: image,
    imageBuilder: (context, imageProvider)=> Container (
      decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )
      ),
    ),
    progressIndicatorBuilder: (context ,url , downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
    // placeholder: (context , url) => const Center(child: CircularProgressIndicator(),),
    errorWidget: (context , url , error) => const Icon(Icons.error),
  );
}