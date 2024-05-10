class UserModel {
  final String? userUID;
  final String? userName;
  final String? userImage;
  final String? userPhoneNumber;
  final String? userEmail;
  final String? userStatus;
  final String? status ;
  UserModel({
    this.status,
    required this.userUID,
    required this.userName,
    required this.userImage,
    required this.userPhoneNumber,
    required this.userEmail,
    required this.userStatus
});
  factory UserModel.fromJson(Map<String,dynamic> jsonData){
     return UserModel(
       userUID: jsonData["UserUID"],
       userName: jsonData["UserName"],
       userImage: jsonData["UserImage"],
       userEmail: jsonData["UserEmail"],
       userPhoneNumber: jsonData["UserPhoneNumber"],
       userStatus: jsonData["UserStatus"],
       status: jsonData["status"]
     );
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
     data["UserUID"] = userUID;
     data["UserName"] = userName;
     data["UserImage"] = userImage;
     data["UserEmail"] = userEmail ;
     data["UserStatus"] = userStatus;
     return data ;
  }
}