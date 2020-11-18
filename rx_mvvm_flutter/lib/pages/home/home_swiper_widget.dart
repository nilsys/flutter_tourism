import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/widgets/cached_image.dart';

// 首页轮播广告
class HomeSwiperWidget extends StatefulWidget {
  final List<HomeBanner> bannerData;
  final double height;

  const HomeSwiperWidget({Key key, this.bannerData, this.height})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomeSwiperWidget> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = widget.bannerData == null || widget.bannerData.length == 0;
    return isEmpty
        ? Container()
        : Container(
            height: widget.height,
            width: double.infinity,
            child: isEmpty ? _noDataWidget() : _swiperWidget(),
          );
  }

  Widget _noDataWidget() {
    return Container(
      height: ScreenUtil.instance.setHeight(400.0),
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text(Strings.NO_DATA_TEXT),
    );
  }

  Widget _swiperWidget() {
    return Swiper(
      onTap: (index) {
        print(index);
      },
      itemCount: widget.bannerData.length,
      //滚动方向，设置为Axis.vertical如果需要垂直滚动
      scrollDirection: Axis.horizontal,
      //无限轮播模式开关
      loop: true,
      //初始的时候下标位置
      index: 0,
      autoplay: false,
      duration: 10000,
      pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              size: 8.0,
              color: Colors.white,
              activeColor: Colors.deepOrangeAccent)),
      itemBuilder: (context, index) => _renderItem(context, index),
    );
  }

  Widget _renderItem(BuildContext context, int index) {
    //print(widget.bannerData[index].url);
    return CachedImageView(
        double.infinity, double.infinity, widget.bannerData[index].url);
  }
}
