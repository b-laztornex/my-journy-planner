import 'dart:convert' show utf8;

class Recomendation {
  Coordinates? coord;
  String? name;
  String? desc;

  Recomendation({
    this.coord,
    this.name,
    this.desc,
  });
}

class SearchRequestModel {
  String? query;

  SearchRequestModel({
    this.query,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['query'] = query;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lon;
  Coordinates({
    this.lat,
    this.lon,
  });
}

class ParentData {
  String? id;
  String? name;
  String? type;
  ParentData({
    this.id,
    this.name,
    this.type,
  });
}

class SearchResponseModel {
  String? id;
  String? name;
  String? streetName;
  Coordinates? coord;
  String? type;
  num? matchQuality;
  bool? isBest;
  ParentData? parent;

  SearchResponseModel({
    this.id,
    this.name,
    this.streetName,
    this.coord,
    this.type,
    this.matchQuality,
    this.isBest,
    this.parent,
  });

  setStringToUtf8(name) {
    if (name != null && name.isNotEmpty) {
      var utf8runesList = name.runes.toList();
      var decoteString = utf8.decode(utf8runesList);
      return decoteString;
    } else {
      return '';
    }
  }

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = setStringToUtf8(json['name']);
    streetName = setStringToUtf8(json['streetName']);
    coord = Coordinates(lat: json['coord'][0], lon: json['coord'][1]);
    type = json['type'];
    matchQuality = json['matchQuality'];
    isBest = json['isBest'];
    parent = ParentData(
        id: json['parent']['id'],
        name: json['parent']['name'],
        type: json['parent']['type']);
  }
}
