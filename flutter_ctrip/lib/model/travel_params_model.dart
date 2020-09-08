import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class TravelParamsModel {
  TravelParamsModel({
    this.url,
    this.params,
    this.tabs,
  });

  factory TravelParamsModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Tabs> tabs = jsonRes['tabs'] is List ? <Tabs>[] : null;
    if (tabs != null) {
      for (final dynamic item in jsonRes['tabs']) {
        if (item != null) {
          tabs.add(Tabs.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return TravelParamsModel(
      url: asT<String>(jsonRes['url']),
      params: Params.fromJson(asT<Map<String, dynamic>>(jsonRes['params'])),
      tabs: tabs,
    );
  }

  String url;
  Params params;
  List<Tabs> tabs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'params': params,
        'tabs': tabs,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Params {
  Params({
    this.districtId,
    this.groupChannelCode,
    this.type,
    this.lat,
    this.lon,
    this.locatedDistrictId,
    this.pagePara,
    this.imageCutType,
    this.head,
    this.contentType,
  });

  factory Params.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Params(
          districtId: asT<int>(jsonRes['districtId']),
          groupChannelCode: asT<String>(jsonRes['groupChannelCode']),
          type: asT<Object>(jsonRes['type']),
          lat: asT<int>(jsonRes['lat']),
          lon: asT<int>(jsonRes['lon']),
          locatedDistrictId: asT<int>(jsonRes['locatedDistrictId']),
          pagePara:
              PagePara.fromJson(asT<Map<String, dynamic>>(jsonRes['pagePara'])),
          imageCutType: asT<int>(jsonRes['imageCutType']),
          head: Head.fromJson(asT<Map<String, dynamic>>(jsonRes['head'])),
          contentType: asT<String>(jsonRes['contentType']),
        );

  int districtId;
  String groupChannelCode;
  Object type;
  int lat;
  int lon;
  int locatedDistrictId;
  PagePara pagePara;
  int imageCutType;
  Head head;
  String contentType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'districtId': districtId,
        'groupChannelCode': groupChannelCode,
        'type': type,
        'lat': lat,
        'lon': lon,
        'locatedDistrictId': locatedDistrictId,
        'pagePara': pagePara,
        'imageCutType': imageCutType,
        'head': head,
        'contentType': contentType,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class PagePara {
  PagePara({
    this.pageIndex,
    this.pageSize,
    this.sortType,
    this.sortDirection,
  });

  factory PagePara.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : PagePara(
          pageIndex: asT<int>(jsonRes['pageIndex']),
          pageSize: asT<int>(jsonRes['pageSize']),
          sortType: asT<int>(jsonRes['sortType']),
          sortDirection: asT<int>(jsonRes['sortDirection']),
        );

  int pageIndex;
  int pageSize;
  int sortType;
  int sortDirection;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageIndex': pageIndex,
        'pageSize': pageSize,
        'sortType': sortType,
        'sortDirection': sortDirection,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Head {
  Head({
    this.cid,
    this.ctok,
    this.cver,
    this.lang,
    this.sid,
    this.syscode,
    this.auth,
    this.extension,
  });

  factory Head.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Extension> extension =
        jsonRes['extension'] is List ? <Extension>[] : null;
    if (extension != null) {
      for (final dynamic item in jsonRes['extension']) {
        if (item != null) {
          extension.add(Extension.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return Head(
      cid: asT<String>(jsonRes['cid']),
      ctok: asT<String>(jsonRes['ctok']),
      cver: asT<String>(jsonRes['cver']),
      lang: asT<String>(jsonRes['lang']),
      sid: asT<String>(jsonRes['sid']),
      syscode: asT<String>(jsonRes['syscode']),
      auth: asT<Object>(jsonRes['auth']),
      extension: extension,
    );
  }

  String cid;
  String ctok;
  String cver;
  String lang;
  String sid;
  String syscode;
  Object auth;
  List<Extension> extension;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cid': cid,
        'ctok': ctok,
        'cver': cver,
        'lang': lang,
        'sid': sid,
        'syscode': syscode,
        'auth': auth,
        'extension': extension,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Extension {
  Extension({
    this.name,
    this.value,
  });

  factory Extension.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Extension(
          name: asT<String>(jsonRes['name']),
          value: asT<String>(jsonRes['value']),
        );

  String name;
  String value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'value': value,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Tabs {
  Tabs({
    this.labelName,
    this.groupChannelCode,
  });

  factory Tabs.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Tabs(
          labelName: asT<String>(jsonRes['labelName']),
          groupChannelCode: asT<String>(jsonRes['groupChannelCode']),
        );

  String labelName;
  String groupChannelCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'labelName': labelName,
        'groupChannelCode': groupChannelCode,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
