import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../widgets/user_report_design_widget.dart';

class NewReportScreen extends StatefulWidget {
  const NewReportScreen({super.key});

  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}

class _NewReportScreenState extends State<NewReportScreen> { final _advancedDrawerController = AdvancedDrawerController();

@override
void initState() {
  super.initState();
}

@override
Widget build(BuildContext context) {
  ScreenSize.size(context);
  return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: customDrawer(context),
      child: Scaffold(
        appBar: CustomAppBar(
          isOn: true,
          leading: IconButton(
            onPressed: ()=> handleMenuButtonPressed(_advancedDrawerController),
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    key: ValueKey<bool>(value.visible),
                    child: Icon(value.visible ? Icons.clear : Icons.menu));
              },
            ),
          ),
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
                    return AdminReportDesignWidget(
                      userModel : userModel,
                      context : context,
                    );
                  } ),
            );
          },
        ),
      ));
}


}

