class UserModel {
  String? userName;
  String? email;
  String? uId;

  UserModel({
    this.userName,
    this.email,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    userName = json['userName'];
    email = json['email'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson()
  {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
    };
  }
}
