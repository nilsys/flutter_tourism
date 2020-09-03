import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/// 缓存网络图片
class CachedImageBox extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final String placeholder;
  final String error;

  CachedImageBox(String s,
      {this.url, this.fit = BoxFit.contain, this.placeholder, this.error});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.url,
      fit: this.fit,
      placeholder: (context, url) {
        if (placeholder == null) {
          return Container(
            color: Colors.grey[350],
            alignment: Alignment.center,
            child: Text(
              'Loading...',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(26.0), color: Colors.white),
            ),
          );
        } else {
          return Image.asset(this.placeholder);
        }
      },
      errorWidget: (context, url, error) {
        if (error == null) {
          return Container(
            color: Colors.grey[350],
            alignment: Alignment.center,
            child: Text(
              'error',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(26.0), color: Colors.white),
            ),
          );
        } else {
          return Image.asset(this.error);
        }
      },
    );
    /*
    return CachedNetworkImage(
      imageUrl: this.url,
      fit: BoxFit.contain,
      width: this.width,
      height: this.height,
      placeholder: (BuildContext context, String url) {
        return Container(
          width: this.width,
          color: Colors.grey[350],
          height: this.height,
          alignment: Alignment.center,
          child: Text(
            'Loading...',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(26.0), color: Colors.white),
          ),
        );
      },
    );
    */
  }
}
