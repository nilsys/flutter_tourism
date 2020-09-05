import 'package:equatable/equatable.dart';

class TravelParamsModel extends Equatable  {
	final String url;
	final Params params;
	final List<Tabs> tabs;

	TravelParamsModel({this.url, this.params, this.tabs});

	factory TravelParamsModel.fromJson(Map<String, dynamic> json) {
		return TravelParamsModel(
			url: json['url'],
			params: json['params'] != null ? new Params.fromJson(json['params']) : null,
			tabs: json['tabs'] != null ? json['tabs'].map((v) => new Tabs.fromJson(v)).toList() : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		if (this.params != null) {
      data['params'] = this.params.toJson();
    }
		if (this.tabs!= null) {
      data['tabs'] = this.tabs.map((v) => v.toJson()).toList();
    }
		return data;
	}

	@override
	List<Object> get props => [
		this.url,
		this.params,
		this.tabs
	];
}

class Tabs extends Equatable  {
	final String labelName;
	final String groupChannelCode;

	Tabs({this.labelName, this.groupChannelCode});

	factory Tabs.fromJson(Map<String, dynamic> json) {
		return Tabs(
			labelName: json['labelName'],
			groupChannelCode: json['groupChannelCode'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['labelName'] = this.labelName;
		data['groupChannelCode'] = this.groupChannelCode;
		return data;
	}

	@override
	List<Object> get props => [
		this.labelName,
		this.groupChannelCode
	];
}

class Params extends Equatable  {
	final int districtId;
	final String groupChannelCode;
	final String type;
	final int lat;
	final int lon;
	final int locatedDistrictId;
	final PagePara pagePara;
	final int imageCutType;
	final Head head;
	final String contentType;

	Params({this.districtId, this.groupChannelCode, this.type, this.lat, this.lon, this.locatedDistrictId, this.pagePara, this.imageCutType, this.head, this.contentType});

	factory Params.fromJson(Map<String, dynamic> json) {
		return Params(
			districtId: json['districtId'],
			groupChannelCode: json['groupChannelCode'],
			type: json['type'],
			lat: json['lat'],
			lon: json['lon'],
			locatedDistrictId: json['locatedDistrictId'],
			pagePara: json['pagePara'] != null ? new PagePara.fromJson(json['pagePara']) : null,
			imageCutType: json['imageCutType'],
			head: json['head'] != null ? new Head.fromJson(json['head']) : null,
			contentType: json['contentType'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['districtId'] = this.districtId;
		data['groupChannelCode'] = this.groupChannelCode;
		data['type'] = this.type;
		data['lat'] = this.lat;
		data['lon'] = this.lon;
		data['locatedDistrictId'] = this.locatedDistrictId;
		if (this.pagePara != null) {
      data['pagePara'] = this.pagePara.toJson();
    }
		data['imageCutType'] = this.imageCutType;
		if (this.head != null) {
      data['head'] = this.head.toJson();
    }
		data['contentType'] = this.contentType;
		return data;
	}

	@override
	List<Object> get props => [
		this.districtId,
		this.groupChannelCode,
		this.type,
		this.lat,
		this.lon,
		this.locatedDistrictId,
		this.pagePara,
		this.imageCutType,
		this.head,
		this.contentType
	];
}

class Extension extends Equatable  {
	final String name;
	final String value;

	Extension({this.name, this.value});

	factory Extension.fromJson(Map<String, dynamic> json) {
		return Extension(
			name: json['name'],
			value: json['value'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['value'] = this.value;
		return data;
	}

	@override
	List<Object> get props => [
		this.name,
		this.value
	];
}

class Head extends Equatable  {
	final String cid;
	final String ctok;
	final String cver;
	final String lang;
	final String sid;
	final String syscode;
	final String auth;
	final List<Extension> extension;

	Head({this.cid, this.ctok, this.cver, this.lang, this.sid, this.syscode, this.auth, this.extension});

	factory Head.fromJson(Map<String, dynamic> json) {
		return Head(
			cid: json['cid'],
			ctok: json['ctok'],
			cver: json['cver'],
			lang: json['lang'],
			sid: json['sid'],
			syscode: json['syscode'],
			auth: json['auth'],
			extension: json['extension'] != null ? json['extension'].map((v) => new Extension.fromJson(v)).toList() : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cid'] = this.cid;
		data['ctok'] = this.ctok;
		data['cver'] = this.cver;
		data['lang'] = this.lang;
		data['sid'] = this.sid;
		data['syscode'] = this.syscode;
		data['auth'] = this.auth;
		if (this.extension!= null) {
      data['extension'] = this.extension.map((v) => v.toJson()).toList();
    }
		return data;
	}

	@override
	List<Object> get props => [
		this.cid,
		this.ctok,
		this.cver,
		this.lang,
		this.sid,
		this.syscode,
		this.auth,
		this.extension
	];
}

class PagePara extends Equatable  {
	final int pageIndex;
	final int pageSize;
	final int sortType;
	final int sortDirection;

	PagePara({this.pageIndex, this.pageSize, this.sortType, this.sortDirection});

	factory PagePara.fromJson(Map<String, dynamic> json) {
		return PagePara(
			pageIndex: json['pageIndex'],
			pageSize: json['pageSize'],
			sortType: json['sortType'],
			sortDirection: json['sortDirection'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pageIndex'] = this.pageIndex;
		data['pageSize'] = this.pageSize;
		data['sortType'] = this.sortType;
		data['sortDirection'] = this.sortDirection;
		return data;
	}

	@override
	List<Object> get props => [
		this.pageIndex,
		this.pageSize,
		this.sortType,
		this.sortDirection
	];
}
