class Myaddress{
  ListAddress? listAddress;
Myaddress.fromJson(Map<String,dynamic>json){
  listAddress=ListAddress.fromJson(json['data']);
}
}
class ListAddress{
  List<Address>address=[];
  ListAddress.fromJson(Map<String,dynamic>json){
    json['data'].forEach((e){
      address.add(Address.fromJson(e));
    });
  }
}
class Address{
  dynamic id;
  dynamic name;
  dynamic city;
  dynamic region;
  dynamic details;
  dynamic notes;
  dynamic latitude;
  dynamic longitude;

  Address({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });
  Address.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    city=json['city'];
    region=json['region'];
    details=json['details'];
    notes=json['notes'];
    latitude=json['latitude'];
    longitude=json['longitude'];
  }
}