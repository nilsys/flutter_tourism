import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/widgets/cached_image.dart';

// 首页的分类
class HomeCategoryMenuWidget extends StatelessWidget {
  List<HomeChannel> categoryList;

  HomeCategoryMenuWidget(this.categoryList);

  _goCategoryView(BuildContext context, HomeChannel channel) {
    /*
    NavigatorUtils.goCategoryGoodsListPage(
        context, channel.name, channel.id);
        */
  }

  @override
  Widget build(BuildContext context) {
    bool isEmpty = categoryList == null || categoryList.length == 0;
    return Container(
        child: isEmpty
            ? Container()
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  //  return _getGridViewItem(categoryList[index]);
                  return _getGridViewItem(context, categoryList[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //单个子Widget的水平最大宽度
                  crossAxisCount: 5,
                  //水平单个子Widget之间间距
                  mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
                ),
              ));
  }

  Widget _getGridViewItem(BuildContext context, HomeChannel channel) {
    return Center(
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            CachedImageView(ScreenUtil.instance.setWidth(60.0),
                ScreenUtil.instance.setWidth(60.0), channel.iconUrl),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            ),
            Text(
              channel.name,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
