import 'package:cloud_firestore/cloud_firestore.dart';
class ReportModel {
  Timestamp publishedDate;
  String? reportID;
  String? userUID;
  String? tasks;
  String? constructionCosts;
  int? kwc;
  String? observations;
  List<String> people;

  ReportModel({
    required this.people,
     required this.publishedDate,
     this.reportID,
     this.userUID,
     this.tasks,
     this.constructionCosts,
     this.kwc,
     this.observations
  });

  factory ReportModel.fromJson(Map<String, dynamic> jsonData) {
    return ReportModel(
      reportID: jsonData["reportID"],
      userUID: jsonData["userUID"],
      publishedDate: jsonData["publishedDate"],
      tasks: jsonData["tasks"],
      constructionCosts: jsonData["constructionCosts"],
      kwc: jsonData["kwc"],
      observations: jsonData["observations"],
      people: jsonData["people"],
    );
  }

  Map<String, dynamic> toJson(){
    Map<String,dynamic>  data = <String,dynamic>{};
    data["publishedDate"] = publishedDate;
    data["reportId"] = reportID;
    data["userUID"] = userUID;
    data["tasks"] = tasks;
    data["constructionCosts"] = constructionCosts;
    data["kwc"] = kwc;
    data["observations"] = observations;
    return data;
  }
}