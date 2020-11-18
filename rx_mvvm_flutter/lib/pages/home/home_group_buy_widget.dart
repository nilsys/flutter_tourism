import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/widgets/cached_image.dart';

class HomeGroupBuyWidget extends StatefulWidget {
  final List<HomeGrouponList> groupEntitys;

  const HomeGroupBuyWidget({Key key, this.groupEntitys}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomeGroupBuyWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.groupEntitys.length,
      itemBuilder: (context, index) => _renderRow(widget.groupEntitys[index]),
    );
  }

  Widget _renderRow(HomeGrouponList groupBuyEntity) {
    return Container(
      height: ScreenUtil.instance.setHeight(200.0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedImageView(ScreenUtil.instance.setWidth(120.0),
                ScreenUtil.instance.setWidth(120.0), groupBuyEntity.picUrl),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  groupBuyEntity.name,
                  style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(26.0),
                      color: Colors.black87),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
                ),
                Text(
                  groupBuyEntity.brief,
                  style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(26.0),
                      color: Colors.black54),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "原价${groupBuyEntity.retailPrice}",
                      style: TextStyle(
                          fontSize: ScreenUtil.instance.setSp(24.0),
                          color: Colors.grey[850],
                          decoration: TextDecoration.lineThrough,
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(10.0)),
                    ),
                    Text(
                      "现价${groupBuyEntity.retailPrice}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: ScreenUtil.instance.setSp(24.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenUtil.instance.setWidth(5.0)),
                  height: ScreenUtil.instance.setHeight(48.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: new Border.all(
                          color: Colors.deepOrangeAccent, width: 0.5),
                      // 边色与边宽度
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white),
                  child: Text(
                    "${groupBuyEntity.grouponMember}成团",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtil.instance.setWidth(20.0))),
                Container(
                  padding: EdgeInsets.all(ScreenUtil.instance.setWidth(5.0)),
                  height: ScreenUtil.instance.setHeight(48.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.red, width: 0.5),
                      // 边色与边宽度
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white),
                  child: Text(
                    "立减${groupBuyEntity.grouponMember}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtil.instance.setWidth(20.0)))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
