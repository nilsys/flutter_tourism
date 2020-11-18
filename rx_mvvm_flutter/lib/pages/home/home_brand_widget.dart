import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/widgets/cached_image.dart';

class HomeBrandWidget extends StatefulWidget {
  final List<HomeBrandList> brands;

  const HomeBrandWidget({Key key, this.brands}) : super(key: key);

  @override
  _State createState() => _State();
}

_goBrandDetail(HomeBrandList brand) {}

class _State extends State<HomeBrandWidget> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = widget.brands == null || widget.brands.length == 0;
    return Container(
      child: isEmpty
          ? Container()
          : ListView.builder(
              itemCount: widget.brands.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _renderRow(widget.brands[index]),
            ),
    );
  }

  Widget _renderRow(HomeBrandList brand) {
    return Card(
      child: Container(
        child: InkWell(
          onTap: () => _goBrandDetail(brand),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: CachedImageView(double.infinity,
                    ScreenUtil.instance.setWidth(260.0), brand.picUrl),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
                  child: Text(
                    brand.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(28.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
                  child: Text(
                    brand.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(20.0),
                      bottom: ScreenUtil.instance.setHeight(20.0)),
                  child: Text(
                    Strings.DOLLAR + "${brand.floorPrice}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
