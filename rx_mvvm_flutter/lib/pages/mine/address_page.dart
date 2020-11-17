import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';

class AddressPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MY_ADDRESS),
        centerTitle: true,
        actions: [
          InkWell(
              child: Container(
            margin: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => _goAddressEdit(0),
              child: Text(Strings.ADD_ADDRESS),
            ),
          ))
        ],
      ),
    );
  }

  _goAddressEdit(var addressId) {
    /*
      NavigatorUtils.goAddressEdit(context, addressId).then((bool) {
        _getAddressData();
      });
      */
  }
}
