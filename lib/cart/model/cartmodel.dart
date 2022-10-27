class Cart {
  CartItems? cartitem;
  dynamic total;

  Cart({
    this.cartitem,
    this.total
  });

  Cart.fromJson(Map<String, dynamic> json) {
    total=json['data']['total'];
    cartitem = CartItems.forJson(json['data']);
  }
}

class CartItems {
  List<CartItem> list = [];

  CartItems({
    required this.list,
  });

  CartItems.forJson(Map<String, dynamic> json) {
    json['cart_items'].forEach((e) {
      list.add(CartItem.fromJson(e));
    });
  }
}

class CartItem {
  dynamic id;
  dynamic quantity;
  products? product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = products.formJson(json['product']);
  }
}

class products {
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;
  dynamic in_favorites;
  dynamic in_cart;
  List<String> images = [];

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

  products.formJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
    json['images'].forEach((element) {
      images.add(element);
    });
  }
}
