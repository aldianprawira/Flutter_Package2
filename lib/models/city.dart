import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  String id;
  String provinceId;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
  
  @override
  String toString() => name;
}
