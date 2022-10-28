class myfavorit{
  favoriteslist? favorit;
  myfavorit.forJson(Map<String,dynamic>json){
    favorit=favoriteslist.formJson(json['data']);
  }
}
class favoriteslist{
  List<obejctfavorit>favorit=[];
  favoriteslist.formJson(Map<String,dynamic>json){
    json['data'].forEach((element){
      favorit.add(obejctfavorit.fromJson(element));
    });
  }
}
class obejctfavorit{
  favorites? favo;
  obejctfavorit.fromJson(Map<String,dynamic>json){
    favo=favorites.formJson(json['product']);

  }
}
class favorites{
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;


  favorites({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,

  });
  favorites.formJson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
  }
}
