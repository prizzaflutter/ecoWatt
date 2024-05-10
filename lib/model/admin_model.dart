class AdminModel {
  final String? adminUID;
  final String? adminName;
  final String? adminImage;
  final String? adminPhoneNumber;
  final String? adminEmail;
  final String? adminStatus;
  final String? status;
  AdminModel({
    this.status,
    required this.adminUID,
    required this.adminName,
    required this.adminImage,
    required this.adminPhoneNumber,
    required this.adminEmail,
    required this.adminStatus
  });
  factory AdminModel.fromJson(Map<String,dynamic> jsonData){
    return AdminModel(
        adminUID: jsonData["AdminUID"],
        adminName: jsonData["AdminName"],
        adminImage: jsonData["AdminImage"],
        adminEmail: jsonData["AdminEmail"],
        adminPhoneNumber: jsonData["AdminPhoneNumber"],
        adminStatus: jsonData["AdminStatus"],
        status: jsonData["status"]
    );
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["AdminUID"] = adminUID;
    data["AdminName"] = adminName;
    data["AdminImage"] = adminImage;
    data["AdminEmail"] = adminEmail ;
    data["AdminStatus"] = adminStatus;
    data["status"] = status;
    return data ;
  }
}