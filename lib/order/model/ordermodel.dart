class Order{
 dynamic payment_method;
 dynamic cost;
 dynamic vat;
 dynamic discount;
 dynamic points;
 dynamic total;
 dynamic id;

 Order({
    required this.payment_method,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.points,
    required this.total,
    required this.id,
  });
 Order.fromJson(Map<String,dynamic>json){
   payment_method=json['payment_method'];
   cost=json['cost'];
   vat=json['vat'];
   discount=json['discount'];
   points=json['points'];
   total=json['total'];
   id=json['id'];
 }
}