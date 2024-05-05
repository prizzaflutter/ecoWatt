import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../../widgets/user_report_design_widget.dart';
class NewReportScreen extends StatefulWidget {
  const NewReportScreen({super.key});

  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}

class _NewReportScreenState extends State<NewReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isOn: true,
      ),
      drawer: Drawer(
        child: customDrawer(context),
      ),
body:  StreamBuilder(
  stream: firebaseFirestore.collection("Users").snapshots(),
  builder: (context,snapshot){
    return !snapshot.hasData ? const Center(child:CircularProgressIndicator())
        : SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
            UserModel userModel = UserModel.fromJson(snapshot.data!.docs[index].data());
            return UserReportDesignWidget(
              userModel : userModel,
              context : context,
            );
          } ),
    );
  },
),
    );
  }
}

