class Data {
  Data({
    required this.addr,
    required this.code,
    required this.color,
    required this.inventory,
    required this.lat,
    required this.lng,
    required this.name,
    required this.openTime,
    required this.price,
    required this.regDt,
    required this.tel,
  });
  final String? addr;
  final String? code;
  final String? color;
  final String? inventory;
  final String? lat;
  final String? lng;
  final String? name;
  final String? openTime;
  final String? price;
  final String? regDt;
  final String? tel;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      addr: json['addr'],
      code: json['code'],
      color: json['color'],
      inventory: json['inventory'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      openTime: json['openTime'],
      price: json['price'],
      regDt: json['regDt'],
      tel: json['tel'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['addr'] = addr;
    _data['code'] = code;
    _data['color'] = color;
    _data['inventory'] = inventory;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['name'] = name;
    _data['openTime'] = openTime;
    _data['price'] = price;
    _data['regDt'] = regDt;
    _data['tel'] = tel;
    return _data;
  }
}
