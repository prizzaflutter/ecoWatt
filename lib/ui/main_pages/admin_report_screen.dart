import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/chat_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/friend_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../model/report_model.dart';
import '../../model/user_model.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../widgets/_bottom_sheet_widget.dart';
import '../../widgets/cached_network_image.dart';

class AdminReportScreen extends StatefulWidget {
  final UserModel userModel;

  const AdminReportScreen({super.key, required this.userModel});

  @override
  State<AdminReportScreen> createState() => _AdminReportScreenState();
}
 TextEditingController  messageController = TextEditingController();
double _calculatePercentage(double constructionsCosts) {
  double maxConstructionsCostsAssumed = 1000;
  debugPrint((constructionsCosts / maxConstructionsCostsAssumed)
      .clamp(0.0, 1.0)
      .toString());
  return (constructionsCosts / maxConstructionsCostsAssumed).clamp(0.0, 1.0);
}

TextEditingController tasksController = TextEditingController();

class _AdminReportScreenState extends State<AdminReportScreen> {
  bool? isTasks = false;

  bool? isObservations = false;

  List<String> tasks = ["askour", "idriss"];
  String? observations =
      "askour asdkour idriss is not here for now brother adnd sister";

  @override
  Widget build(BuildContext context) {
    Future<void> createAndSavePDF() async {
      final pdf = pw.Document();
      final fontData = await rootBundle.load("lib/assets/fonts/Voguella.ttf");
      final ttf = pw.Font.ttf(fontData.buffer.asByteData());

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                pw.Text('Tasks:', style: pw.TextStyle(font: ttf)),
                // Replace with your actual list of tasks
                for (var task in tasks)
                  pw.Text(task, style: pw.TextStyle(font: ttf)),
                pw.SizedBox(height: 20),
                pw.Text('Observations:', style: pw.TextStyle(font: ttf)),
                pw.Text(observations ?? '', style: pw.TextStyle(font: ttf)),
              ],
            );
          },
        ),
      );

      final directory = await getExternalStorageDirectory();
      final file = File("${directory?.path}/example.pdf");
      await file.writeAsBytes(await pdf.save());

      debugPrint("PDF saved at: ${file.path}");
    }

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back)),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FriendProfileScreen(
                          userModel: widget.userModel,
                        ))),
                child: Hero(
                  tag: "profile",
                  child: cachedNetworkImage(
                      image: widget.userModel.userImage!,
                      width: 50,
                      height: 50),
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/phone.png",
                  width: 30,
                  height: 20,
                )),
            GestureDetector(
                onTap: () {
                  // bottomSheetWidget(context: context, userModel: widget.userModel,controller: messageController);
                  Navigator.of(context).push(
                    PageTransition(child: chatScreen(controller: messageController,userModel: widget.userModel,context : context,), type: PageTransitionType.rightToLeft),
                  );
                },
                child:  Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/chat.png",
                  width: 30,
                  height: 20,
                )),
            GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/dots.png",
                  width: 30,
                  height: 20,
                )),
          ],
          title: GestureDetector(
            onTap: () => Navigator.of(context).push(PageTransition(
                child: FriendProfileScreen(userModel: widget.userModel),
                type: PageTransitionType.fade)),
            child: Hero(
              tag: "profileName",
              child: Text(
                widget.userModel.userName.toString(),
                style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: StreamBuilder(
          stream: firebaseFirestore
              .collection("Users")
              .doc(widget.userModel.userUID.toString())
              .collection("Reports")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PageView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      ReportModel reportModel = ReportModel.fromJson(
                          snapshot.data?.docs[index].data());
                      return !snapshot.hasData
                          ? const Center(child: Text("No Data Avalaible"))
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                    ),
                                    title: Text(formatDate(
                                        reportModel.publishedDate.toDate(),
                                        [yyyy, '-', mm, '-', dd]).toString()),
                                    trailing: Text(
                                        "ID:${reportModel.reportID.toString()}"),
                                  ),
                                  GridView.count(
                                    crossAxisCount: 2,
                                    scrollDirection: Axis.vertical,
                                    padding: const EdgeInsets.all(10),
                                    shrinkWrap: true,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                              )
                                            ]),
                                        child: CircularPercentIndicator(
                                          animation: true,
                                          animationDuration: 1000,
                                          radius: 70.0,
                                          lineWidth: 20.0,
                                          percent: _calculatePercentage(
                                              reportModel.constructionCosts!
                                                  .toDouble()),
                                          center: Text(
                                            "${reportModel.constructionCosts} DH",
                                            style: GoogleFonts.acme(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          backgroundColor: Colors.redAccent,
                                          progressColor: Colors.blue,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                              )
                                            ]),
                                        child: CircularPercentIndicator(
                                          animationDuration: 1000,
                                          animation: true,
                                          restartAnimation: false,
                                          radius: 70.0,
                                          lineWidth: 20.0,
                                          percent: _calculatePercentage(
                                              reportModel.kwc!.toDouble()),
                                          center: Text(
                                            "${reportModel.kwc} KWs",
                                            style: GoogleFonts.acme(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          backgroundColor: Colors.redAccent,
                                          progressColor: Colors.blue,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isTasks = !isTasks!;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade100,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                )
                                              ]),
                                          height: ScreenSize.height! * 0.04,
                                          width: ScreenSize.width! * 1,
                                          child: Center(
                                            child: Text(
                                              "Tesks",
                                              style:
                                                  GoogleFonts.zenKakuGothicNew(
                                                textStyle: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isTasks! ? true : false,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade100,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                )
                                              ]),
                                          height: ScreenSize.height! * 0.2,
                                          width: ScreenSize.width! * 1,
                                          child: ListView.builder(
                                            itemCount:
                                                reportModel.tasks!.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    30))),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text.rich(TextSpan(
                                                    text:
                                                        "${index + 1}- ${reportModel.tasks![index].toString()}",
                                                    style: const TextStyle())),
                                              );
                                            },
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isObservations = !isObservations!;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade100,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                )
                                              ]),
                                          height: ScreenSize.height! * 0.04,
                                          width: ScreenSize.width! * 1,
                                          child: Center(
                                            child: Text(
                                              "Observations",
                                              style:
                                                  GoogleFonts.zenKakuGothicNew(
                                                textStyle: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isObservations! ? true : false,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                              )
                                            ]),
                                        height: ScreenSize.height! * 0.2,
                                        width: ScreenSize.width! * 1,
                                        child: Text(
                                            reportModel.observations.toString(),
                                            style: GoogleFonts.acme()),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await createAndSavePDF();
                                    },
                                    child: const Text("askour"),
                                  )
                                ],
                              ),
                            );
                    },
                  );
          },
        ));
  }
}
