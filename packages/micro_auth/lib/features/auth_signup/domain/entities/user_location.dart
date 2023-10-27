import 'dart:convert';

class UserLocation {
  final String address;
  final String latitude;
  final String longitude;
  UserLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      address: map['address'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) => UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
