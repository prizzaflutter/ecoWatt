

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../../global/global.dart';
import '../../../model/user_model.dart';
import '../../../widgets/custom_widgets/custom_advanced_drawer_widget.dart';
import '../../../widgets/report_screens_widgets/user_card_desgin_widget.dart';

class NewReportScreen extends StatefulWidget {
  const NewReportScreen({super.key});
  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}
class _NewReportScreenState extends State<NewReportScreen> {

  // todo : get list of the user that connect && search by User Name
  Stream<QuerySnapshot>? searchUserList;
  initSearchMenus (String? textEntered) async{
    searchUserList = await firebaseFirestore.collection("Users").where("UserName" , isGreaterThanOrEqualTo: textEntered).snapshots();
  }
  // todo : --------------------------------------------------------

  bool _isSearching = false;
  String? textEntered;
  final  _advancedDrawerController = AdvancedDrawerController();
  final  searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
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

      // todo : i check if the _isSearching == true ? show the Stream of user with UserName == textEntered : show stream of all user
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
                                  return userCardDesignWidget(
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
                                itemCount:  snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  UserModel userModel = UserModel.fromJson(
                                      snapshot.data!.docs[index].data());
                                  return userCardDesignWidget(
                                    userModel: userModel,
                                    context: context,
                                  );
                                }),
                          )
                        : Center(child: Text("No User Found"));
                }
              },
            ),
      // todo : ------------------------------------------------------------------
    );
  }
}
