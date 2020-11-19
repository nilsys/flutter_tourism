import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/widgets/cached_image.dart';

class ProductWidget extends StatelessWidget {
  List<dynamic> productList;

  ProductWidget(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.90),
          itemBuilder: (BuildContext context, int index) {
            return _getGridViewItem(context, productList[index]);
          }),
    );
  }

  _goGoodsDetail(BuildContext context, dynamic goods) {}

  Widget _getGridViewItem(BuildContext context, dynamic productEntity) {
    return Container(
      child: InkWell(
        onTap: () => _goGoodsDetail(context, productEntity),
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: CachedImageView(
                      ScreenUtil.instance.setHeight(200.0),
                      ScreenUtil.instance.setHeight(200.0),
                      productEntity.picUrl)),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  productEntity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.center,
                child: Text(
                  "￥${productEntity.retailPrice}",
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

/*
  Widget _renderProductImage(dynamic productEntity) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: CachedImageView(ScreenUtil.instance.setHeight(200.0),
            ScreenUtil.instance.setHeight(200.0), productEntity.picUrl));
  }
  */
}
