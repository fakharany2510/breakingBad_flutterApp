class CharModel{
  int? char_id;
  String? name;
  String? birthDay;
  String? image;
  String? status;
  String? nakeName;
  String? actorName;
  String? category;

  CharModel.fromJson(Map<String,dynamic> json){
    char_id=json['char_id'];
    name=json['name'];
    birthDay=json['birthday'];
    image=json['img'];
    status=json['status'];
    nakeName=json['nickname'];
    actorName=json['portrayed'];
    category=json['category'];

  }
}

