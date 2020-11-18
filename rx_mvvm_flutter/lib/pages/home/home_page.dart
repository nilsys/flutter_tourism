import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/pages/home/home_category_menu_widget.dart';
import 'package:rx_mvvm_flutter/pages/home/home_coupon_widget.dart';
import 'package:rx_mvvm_flutter/pages/home/home_swiper_widget.dart';
import 'package:rx_mvvm_flutter/service/home_service.dart';
import 'package:rx_mvvm_flutter/utils/utils_header.dart';
import 'package:rx_mvvm_flutter/widgets/dialog/dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  EasyRefreshController _refreshController = EasyRefreshController();
  HomeService _homeService = HomeService();
  HomeData _homeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _queryHomeData();
  }

  _queryHomeData() {
    _homeService.queryHomeData((success) {
      setState(() {
        _homeData = success;
      });
      _refreshController.finishRefresh();
    }, (error) {
      ToastUtil.showToast(error);
      _refreshController.finishRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MALL),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // 搜索
              })
        ],
      ),
      body: _contentWidget(),
    );
  }

  // 主要内容
  Widget _contentWidget() {
    return _homeData == null
        ? LoadingDialog()
        : Container(
            child: EasyRefresh(
              controller: _refreshController,
              header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
              footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
              enableControlFinishRefresh: true,
              enableControlFinishLoad: false,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HomeSwiperWidget(
                        bannerData: _homeData.banner,
                        height: ScreenUtil.instance.setHeight(360.0)),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    HomeCategoryMenuWidget(_homeData.channel),
                    Container(
                      height: (_homeData.couponList == null || _homeData.couponList.length == 0) ? 0 : 40.0,
                      alignment: Alignment.center,
                      child: Text(Strings.COUPON_AREA),
                    ),
                    HomeCouponWidget(_homeData.couponList),
                  ],
                ),
              ),
            ),
          );
  }
}
