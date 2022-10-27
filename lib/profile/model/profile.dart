class Profile{
  dynamic email;
  dynamic name;
  dynamic image;
  dynamic id;
  dynamic phone;

  Profile({
    required this.email,
    required this.name,
    required this.image,
    required this.id,
    required this.phone,
  });

Profile.fromJson(Map<String,dynamic>json){
  id=json['id'];
  email=json['email'];
  phone=json['phone'];
  image=json['image'];
  name=json['name'];
}

}