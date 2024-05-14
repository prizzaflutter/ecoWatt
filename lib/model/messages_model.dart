class Message {
   final String toId;
  final String msg ;
  final String read ;
 final  Type type ;
 final  String fromId;
 final  String sent ;
  Message({
    required this.toId,
    required this.msg ,
    required this.read,
    required this.type ,
    required this.fromId,
    required this.sent
});
  factory Message.fromJson(Map<String,dynamic>json){
    return Message(
      toId: json["toId"],
      msg: json["msg"],
      read: json["read"],
      type: json["type"].toString() == Type.image.name ? Type.image : Type.text,
      fromId: json["fromId"],
      sent: json["sent"],
    );
  }
   Map<String,dynamic> toJson (){
     final data = <String,dynamic>{};
     data["toId"] = toId;
     data["msg"] = msg;
     data["read"] = read;
     data["type"] = type.name;
     data["fromId"] = fromId;
     data["sent"] = sent;
     return data ;
   }
}

enum Type {text , image}