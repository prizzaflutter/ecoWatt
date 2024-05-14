import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../widgets/user_report_design_widget.dart';

class NewReportScreen extends StatefulWidget {
  const NewReportScreen({super.key});
  static String? userUID ;
  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}
class _NewReportScreenState extends State<NewReportScreen> {
  Stream<QuerySnapshot>? searchUserList;
  initSearchMenus (String? textEntered) async{
    searchUserList = await firebaseFirestore.collection("Users").where("UserName" , isGreaterThanOrEqualTo: textEntered).snapshots();
  }

  final _advancedDrawerController = AdvancedDrawerController();
  final List<UserModel> _searchUser = [];
  bool _isSearching = false;
  TextEditingController searchController = TextEditingController();
  String? textEntered;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
      showSwitch: false,
      action: IconButton(
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
          icon: Icon(_isSearching
              ? CupertinoIcons.clear_circled_solid
              : Icons.search)),
      context: context,
      controller: _advancedDrawerController,
      body: _isSearching
          ? StreamBuilder(
              stream: searchUserList,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // if data is loading
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());

                  // if some or all data is loaded the show it

                  case ConnectionState.active:
                  case ConnectionState.done:
                    return snapshot.data!.docs.length != 0
                        ? SizedBox(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  UserModel userModel = UserModel.fromJson(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);
                                  return AdminReportDesignWidget(
                                    userModel: userModel,
                                    context: context,
                                  );
                                }),
                          )
                        : Center(child: Text("No User Found"));
                }
              },
            )
          : StreamBuilder(
              stream: firebaseFirestore.collection("Users").snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // if data is loading
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());

                  // if some or all data is loaded the show it

                  case ConnectionState.active:
                  case ConnectionState.done:
                    return snapshot.data!.docs.length != 0
                        ? SizedBox(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: _isSearching
                                    ? _searchUser.length
                                    : snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  UserModel userModel = UserModel.fromJson(
                                      snapshot.data!.docs[index].data());
                                  return AdminReportDesignWidget(
                                    userModel: userModel,
                                    context: context,
                                  );
                                }),
                          )
                        : Center(child: Text("No User Found"));
                }
              },
            ),
      isAppBar: true,
      pageNmae: _isSearching
          ? TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name, email, ...",
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
              ),
              // When search text changes the updated search List
              onChanged: (value)async {
                setState(() {
                  textEntered = value;
                });
                await initSearchMenus(value);
              },
            )
          : Center(child: Text("Report")),
    );
  }
}
