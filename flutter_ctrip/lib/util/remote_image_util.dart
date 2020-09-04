import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteImageUtil {
    static showNetImg(String url) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Center(
        child: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.all(5),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(
          Icons.terrain,
          size: 64,
        ),
        alignment: Alignment.center,
        color: Colors.black12,
      ),
    );
  }

  static showNetImgWH(String url, double width, double height) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Center(
        child: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.all(5),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(
          Icons.terrain,
          size: 64,
        ),
        alignment: Alignment.center,
        color: Colors.black12,
      ),
    );
  }
}
