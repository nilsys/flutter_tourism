// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity(
    json['data'] as Map<String, dynamic>,
    json['errmsg'] as String,
    json['errno'] as int,
  );
}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errmsg': instance.errmsg,
      'errno': instance.errno,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    (json['banner'] as List)
        ?.map((e) =>
            e == null ? null : HomeBanner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['brandList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeBrandList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['channel'] as List)
        ?.map((e) =>
            e == null ? null : HomeChannel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['couponList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeCouponList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floorGoodsList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeFloorGoodsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['grouponList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeGrouponList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['hotGoodsList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeHotGoodsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['newGoodsList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeNewGoodsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['topicList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeTopicList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'banner': instance.banner,
      'brandList': instance.brandList,
      'channel': instance.channel,
      'couponList': instance.couponList,
      'floorGoodsList': instance.floorGoodsList,
      'grouponList': instance.grouponList,
      'hotGoodsList': instance.hotGoodsList,
      'newGoodsList': instance.newGoodsList,
      'topicList': instance.topicList,
    };

HomeNewGoodsList _$HomeNewGoodsListFromJson(Map<String, dynamic> json) {
  return HomeNewGoodsList(
    json['brief'] as String,
    (json['counterPrice'] as num)?.toDouble(),
    json['id'] as int,
    json['isHot'] as bool,
    json['isNew'] as bool,
    json['name'] as String,
    json['picUrl'] as String,
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HomeNewGoodsListToJson(HomeNewGoodsList instance) =>
    <String, dynamic>{
      'brief': instance.brief,
      'counterPrice': instance.counterPrice,
      'id': instance.id,
      'isHot': instance.isHot,
      'isNew': instance.isNew,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'retailPrice': instance.retailPrice,
    };

HomeBrandList _$HomeBrandListFromJson(Map<String, dynamic> json) {
  return HomeBrandList(
    json['desc'] as String,
    (json['floorPrice'] as num)?.toDouble(),
    json['id'] as int,
    json['name'] as String,
    json['picUrl'] as String,
  );
}

Map<String, dynamic> _$HomeBrandListToJson(HomeBrandList instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'floorPrice': instance.floorPrice,
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
    };

HomeFloorGoodsList _$HomeFloorGoodsListFromJson(Map<String, dynamic> json) {
  return HomeFloorGoodsList(
    (json['goodsList'] as List)
        ?.map((e) => e == null
            ? null
            : HomeGoodsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$HomeFloorGoodsListToJson(HomeFloorGoodsList instance) =>
    <String, dynamic>{
      'goodsList': instance.goodsList,
      'id': instance.id,
      'name': instance.name,
    };

HomeGoodsList _$HomeGoodsListFromJson(Map<String, dynamic> json) {
  return HomeGoodsList(
    json['brief'] as String,
    (json['counterPrice'] as num)?.toDouble(),
    json['id'] as int,
    json['isHot'] as bool,
    json['isNew'] as bool,
    json['name'] as String,
    json['picUrl'] as String,
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HomeGoodsListToJson(HomeGoodsList instance) =>
    <String, dynamic>{
      'brief': instance.brief,
      'counterPrice': instance.counterPrice,
      'id': instance.id,
      'isHot': instance.isHot,
      'isNew': instance.isNew,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'retailPrice': instance.retailPrice,
    };

HomeGrouponList _$HomeGrouponListFromJson(Map<String, dynamic> json) {
  return HomeGrouponList(
    json['brief'] as String,
    (json['counterPrice'] as num)?.toDouble(),
    json['grouponDiscount'] as int,
    json['grouponMember'] as int,
    (json['grouponPrice'] as num)?.toDouble(),
    json['id'] as int,
    json['name'] as String,
    json['picUrl'] as String,
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HomeGrouponListToJson(HomeGrouponList instance) =>
    <String, dynamic>{
      'brief': instance.brief,
      'counterPrice': instance.counterPrice,
      'grouponDiscount': instance.grouponDiscount,
      'grouponMember': instance.grouponMember,
      'grouponPrice': instance.grouponPrice,
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'retailPrice': instance.retailPrice,
    };

HomeHotGoodsList _$HomeHotGoodsListFromJson(Map<String, dynamic> json) {
  return HomeHotGoodsList(
    json['brief'] as String,
    (json['counterPrice'] as num)?.toDouble(),
    json['id'] as int,
    json['isHot'] as bool,
    json['isNew'] as bool,
    json['name'] as String,
    json['picUrl'] as String,
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HomeHotGoodsListToJson(HomeHotGoodsList instance) =>
    <String, dynamic>{
      'brief': instance.brief,
      'counterPrice': instance.counterPrice,
      'id': instance.id,
      'isHot': instance.isHot,
      'isNew': instance.isNew,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'retailPrice': instance.retailPrice,
    };

HomeCouponList _$HomeCouponListFromJson(Map<String, dynamic> json) {
  return HomeCouponList(
    json['days'] as int,
    json['desc'] as String,
    (json['discount'] as num)?.toDouble(),
    json['id'] as int,
    (json['min'] as num)?.toDouble(),
    json['name'] as String,
    json['tag'] as String,
  );
}

Map<String, dynamic> _$HomeCouponListToJson(HomeCouponList instance) =>
    <String, dynamic>{
      'days': instance.days,
      'desc': instance.desc,
      'discount': instance.discount,
      'id': instance.id,
      'min': instance.min,
      'name': instance.name,
      'tag': instance.tag,
    };

HomeTopicList _$HomeTopicListFromJson(Map<String, dynamic> json) {
  return HomeTopicList(
    json['id'] as int,
    json['picUrl'] as String,
    (json['price'] as num)?.toDouble(),
    json['readCount'] as String,
    json['subtitle'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$HomeTopicListToJson(HomeTopicList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picUrl': instance.picUrl,
      'price': instance.price,
      'readCount': instance.readCount,
      'subtitle': instance.subtitle,
      'title': instance.title,
    };

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
    json['addTime'] as String,
    json['content'] as String,
    json['deleted'] as bool,
    json['enabled'] as bool,
    json['id'] as int,
    json['link'] as String,
    json['name'] as String,
    json['position'] as int,
    json['updateTime'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'addTime': instance.addTime,
      'content': instance.content,
      'deleted': instance.deleted,
      'enabled': instance.enabled,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'position': instance.position,
      'updateTime': instance.updateTime,
      'url': instance.url,
    };

HomeChannel _$HomeChannelFromJson(Map<String, dynamic> json) {
  return HomeChannel(
    json['iconUrl'] as String,
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$HomeChannelToJson(HomeChannel instance) =>
    <String, dynamic>{
      'iconUrl': instance.iconUrl,
      'id': instance.id,
      'name': instance.name,
    };
