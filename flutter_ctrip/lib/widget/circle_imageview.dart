import 'package:flutter/material.dart';

/**
 * 圆形头像
 */
class CircleImageView extends StatefulWidget {
  final double width;
  final double height;
  final ImageProvider image;

  const CircleImageView({Key key, this.width, this.height, this.image})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CircleImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.cover, image: widget.image),
      ),
    );
  }
}
