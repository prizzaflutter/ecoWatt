class UserModel {
  final String? userUID;
  final String? userName;
  final String? userImage;
  final String? userEmail;
  final String? userStatus;
  final String? status ;
  UserModel({
    this.status,
    required this.userUID,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userStatus
});
  factory UserModel.fromJson(Map<String,dynamic> jsonData){
     return UserModel(
       userUID: jsonData["UserUID"],
       userName: jsonData["UserName"],
       userImage: jsonData["UserImage"],
       userEmail: jsonData["UserEmail"],
       userStatus: jsonData["UserStatus"],
       status: jsonData["status"]
     );
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
     data["serUID"] = userUID;
     data["userName"] = userName;
     data["userImage"] = userImage;
     data["userEmail"] = userEmail ;
     data["userStatus"] = userStatus;
     return data ;
  }
}