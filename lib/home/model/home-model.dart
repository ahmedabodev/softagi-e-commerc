class Home{
  List<products>product=[];
  List<banners>banner=[];
  Home.fromJson(Map<String,dynamic>json){
    json['products'].forEach((element){
      product.add(products.formJson(element));
    });
    json['banners'].forEach((element){
      banner.add(banners.fromJson(element));
    });
  }
}
class products{
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;
  dynamic in_favorites;
  dynamic in_cart;
  List<String>images=[];

  products({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.in_favorites,
    required this.in_cart,
    required this.images,
  });
  products.formJson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];
    json['images'].forEach((element){
      images.add(element);
    });
  }
}
class banners{
  dynamic id;
  dynamic image;

  banners({
    required this.id,
    required this.image,
  });
  banners.fromJson(Map<String,dynamic>json){
    id=json['id'];
    image=json['image'];
  }
}