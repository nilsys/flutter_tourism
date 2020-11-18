//
//  HomeHomeEntity.dart
//
//
//  Created by JSONConverter on 2020/11/18.
//  Copyright © 2020年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';

@JsonSerializable()
class HomeEntity extends Object {
  @JsonKey(name: 'data')
  Map<String, dynamic> data;

  @JsonKey(name: 'errmsg')
  String errmsg;

  @JsonKey(name: 'errno')
  int errno;

  HomeEntity(
    this.data,
    this.errmsg,
    this.errno,
  );

  factory HomeEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);
}

@JsonSerializable()
class HomeData extends Object {
  @JsonKey(name: 'banner')
  List<HomeBanner> banner;

  @JsonKey(name: 'brandList')
  List<HomeBrandList> brandList;

  @JsonKey(name: 'channel')
  List<HomeChannel> channel;

  @JsonKey(name: 'couponList')
  List<HomeCouponList> couponList;

  @JsonKey(name: 'floorGoodsList')
  List<HomeFloorGoodsList> floorGoodsList;

  @JsonKey(name: 'grouponList')
  List<HomeGrouponList> grouponList;

  @JsonKey(name: 'hotGoodsList')
  List<HomeHotGoodsList> hotGoodsList;

  @JsonKey(name: 'newGoodsList')
  List<HomeNewGoodsList> newGoodsList;

  @JsonKey(name: 'topicList')
  List<HomeTopicList> topicList;

  HomeData(
    this.banner,
    this.brandList,
    this.channel,
    this.couponList,
    this.floorGoodsList,
    this.grouponList,
    this.hotGoodsList,
    this.newGoodsList,
    this.topicList,
  );

  factory HomeData.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

@JsonSerializable()
class HomeNewGoodsList extends Object {
  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isHot')
  bool isHot;

  @JsonKey(name: 'isNew')
  bool isNew;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  HomeNewGoodsList(
    this.brief,
    this.counterPrice,
    this.id,
    this.isHot,
    this.isNew,
    this.name,
    this.picUrl,
    this.retailPrice,
  );

  factory HomeNewGoodsList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeNewGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeNewGoodsListToJson(this);
}

@JsonSerializable()
class HomeBrandList extends Object {
  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'floorPrice')
  double floorPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  HomeBrandList(
    this.desc,
    this.floorPrice,
    this.id,
    this.name,
    this.picUrl,
  );

  factory HomeBrandList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBrandListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBrandListToJson(this);
}

@JsonSerializable()
class HomeFloorGoodsList extends Object {
  @JsonKey(name: 'goodsList')
  List<HomeGoodsList> goodsList;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  HomeFloorGoodsList(
    this.goodsList,
    this.id,
    this.name,
  );

  factory HomeFloorGoodsList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeFloorGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeFloorGoodsListToJson(this);
}

@JsonSerializable()
class HomeGoodsList extends Object {
  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isHot')
  bool isHot;

  @JsonKey(name: 'isNew')
  bool isNew;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  HomeGoodsList(
    this.brief,
    this.counterPrice,
    this.id,
    this.isHot,
    this.isNew,
    this.name,
    this.picUrl,
    this.retailPrice,
  );

  factory HomeGoodsList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeGoodsListToJson(this);
}

@JsonSerializable()
class HomeGrouponList extends Object {
  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'grouponDiscount')
  int grouponDiscount;

  @JsonKey(name: 'grouponMember')
  int grouponMember;

  @JsonKey(name: 'grouponPrice')
  double grouponPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  HomeGrouponList(
    this.brief,
    this.counterPrice,
    this.grouponDiscount,
    this.grouponMember,
    this.grouponPrice,
    this.id,
    this.name,
    this.picUrl,
    this.retailPrice,
  );

  factory HomeGrouponList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeGrouponListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeGrouponListToJson(this);
}

@JsonSerializable()
class HomeHotGoodsList extends Object {
  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isHot')
  bool isHot;

  @JsonKey(name: 'isNew')
  bool isNew;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  HomeHotGoodsList(
    this.brief,
    this.counterPrice,
    this.id,
    this.isHot,
    this.isNew,
    this.name,
    this.picUrl,
    this.retailPrice,
  );

  factory HomeHotGoodsList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeHotGoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeHotGoodsListToJson(this);
}

@JsonSerializable()
class HomeCouponList extends Object {
  @JsonKey(name: 'days')
  int days;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'discount')
  double discount;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'min')
  double min;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'tag')
  String tag;

  HomeCouponList(
    this.days,
    this.desc,
    this.discount,
    this.id,
    this.min,
    this.name,
    this.tag,
  );

  factory HomeCouponList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeCouponListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeCouponListToJson(this);
}

@JsonSerializable()
class HomeTopicList extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'readCount')
  String readCount;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'title')
  String title;

  HomeTopicList(
    this.id,
    this.picUrl,
    this.price,
    this.readCount,
    this.subtitle,
    this.title,
  );

  factory HomeTopicList.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeTopicListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeTopicListToJson(this);
}

@JsonSerializable()
class HomeBanner extends Object {
  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'deleted')
  bool deleted;

  @JsonKey(name: 'enabled')
  bool enabled;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'url')
  String url;

  HomeBanner(
    this.addTime,
    this.content,
    this.deleted,
    this.enabled,
    this.id,
    this.link,
    this.name,
    this.position,
    this.updateTime,
    this.url,
  );

  factory HomeBanner.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}

@JsonSerializable()
class HomeChannel extends Object {
  @JsonKey(name: 'iconUrl')
  String iconUrl;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  HomeChannel(
    this.iconUrl,
    this.id,
    this.name,
  );

  factory HomeChannel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeChannelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeChannelToJson(this);
}
