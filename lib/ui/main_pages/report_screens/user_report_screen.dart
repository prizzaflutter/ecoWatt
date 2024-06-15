import 'dart:io';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screens/chat_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/other_drawer_screens/friend_profile_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screens/pdf_page/pdf_pages/buildTitle.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screens/pdf_page/pdf_pages/build_tasks_section.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screens/pdf_page/pdf_pages/build_user_table.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/vedio_audio_call/vedio_call.dar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../model/Admin_model.dart';
import '../../../model/report_model.dart';
import '../../../model/user_model.dart';
import 'package:pdf/widgets.dart' as pw ;
import '../../../widgets/custom_widgets/custom_cached_network_image.dart';

class userReportScreen extends StatefulWidget {
  final UserModel userModel;

  const userReportScreen({super.key, required this.userModel});

  @override
  State<userReportScreen> createState() => _userReportScreenState();
}

TextEditingController messageController = TextEditingController();

double _calculatePercentage(double constructionsCosts) {
  double maxConstructionsCostsAssumed = 1000;
   ((constructionsCosts / maxConstructionsCostsAssumed)
      .clamp(0.0, 1.0)
      .toString());
  return (constructionsCosts / maxConstructionsCostsAssumed).clamp(0.0, 1.0);
}

TextEditingController tasksController = TextEditingController();

class _userReportScreenState extends State<userReportScreen> {
  bool? isTasks = false;
  bool? isObservations = false;

    ReportModel? reportModelVariable ;

  @override
  Widget build(BuildContext context) {
    Future<void> createAndSavePDF({required BuildContext context, required UserModel userModel, required AdminModel adminModel, required ReportModel reportModel}) async {
      final pdf = pw.Document();

      // Load custom fonts
      final fontData = await rootBundle.load("lib/assets/fonts/Amiri-Regular.ttf");
      final ttf = pw.Font.ttf(fontData.buffer.asByteData());

      final arabicFontData = await rootBundle.load("lib/assets/fonts/TheMixArab-Regular.ttf");
      final arabicTtf = pw.Font.ttf(arabicFontData.buffer.asByteData());

      pdf.addPage(
        pw.MultiPage(
          build: (context) => [
            buildTitle(context: context, userModel: userModel, adminModel: adminModel, reportModel: reportModel),
            buildUserTable(context: context, userModel: userModel, reportModel: reportModel, font: ttf, arabicFont: arabicTtf),
            buildTasksSection(reportModel: reportModel, font: ttf, arabicFont: arabicTtf),
            buildObservationsSection(reportModel: reportModel, font: ttf, arabicFont: arabicTtf),
            buildBarcode(reportModel: reportModel),  // Add the barcode widget
            buildBottom(),
          ],
          theme: pw.ThemeData.withFont(
            base: ttf,
            bold: ttf,
            italic: ttf,
            boldItalic: ttf,
          ),
        ),
      );

      final directory = await getExternalStorageDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File("${directory?.path}/$timestamp.pdf");
      await file.writeAsBytes(await pdf.save());
      debugPrint("PDF saved at: ${file.path}");
    }
    // Future<void> createAndSavePDF(BuildContext context) async {
    //   final pdf = pw.Document();
    //   // final fontData = await rootBundle.load("lib/assets/fonts/Voguella.ttf");
    //   // final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    //   final fontData = await rootBundle.load("lib/assets/fonts/Amiri-Regular.ttf");
    //   final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    //
    //   // load a fallback font that support Arabic characters
    //   final arabicFontData = await rootBundle.load("lib/assets/fonts/TheMixArab-Regular.ttf");
    //   final arabicTtf = pw.Font.ttf(arabicFontData.buffer.asByteData());
    //
    //   pdf.addPage(
    //    pw.MultiPage(build: (context)=>[
    //      buildTitle( context : context , userModel: widget.userModel , reportModel:  reportModelVariable!),
    //      buildUserTable(context : context ,userModel: widget.userModel , reportModel:  reportModelVariable!, font: ttf,arabicFont : arabicTtf),
    //     ])
    //   );
    //
    //   final directory = await getExternalStorageDirectory();
    //   final timestamp = DateTime.now().millisecondsSinceEpoch;
    //   final file = File("${directory?.path}/$timestamp.pdf");
    //   await file.writeAsBytes(await pdf.save());
    //     debugPrint("PDF saved at: ${file.path}");
    // }

    return SafeArea(
      child: Scaffold(
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
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(child: vedioCall(), type: PageTransitionType.rightToLeft)
                    );
                  },
                  child: Image.asset(
                    "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/phone.png",
                    width: 30,
                    height: 20,
                  )),
              GestureDetector(
                  onTap: () {
                    // bottomSheetWidget(context: context, userModel: widget.userModel,controller: messageController);
                    Navigator.of(context).push(
                      PageTransition(
                          child: chatScreen(
                            controller: messageController,
                            userModel: widget.userModel,
                            context: context,
                          ),
                          type: PageTransitionType.rightToLeft),
                    );
                  },
                  child: Image.asset(
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
              switch (snapshot.connectionState) {
                // if data is loading
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());
                // if some or all data is loaded the show it
                case ConnectionState.active:
                case ConnectionState.done:
                  return snapshot.data!.docs.length != 0
                      ? PageView.builder(
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
                                                bottomRight:
                                                    Radius.circular(30),
                                                bottomLeft:
                                                    Radius.circular(30)),
                                          ),
                                          title: Text(format_Date(
                                                  reportModel.publishedDate
                                                      .toDate())
                                              .toString()),
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
                                                    reportModel
                                                        .constructionCosts!
                                                        .toDouble()),
                                                center: Text(
                                                  "${reportModel.constructionCosts} DH",
                                                  style: GoogleFonts.acme(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                                backgroundColor:
                                                    Colors.redAccent,
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
                                                    reportModel.kwc!
                                                        .toDouble()),
                                                center: Text(
                                                  "${reportModel.kwc} KWs",
                                                  style: GoogleFonts.acme(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                                backgroundColor:
                                                    Colors.redAccent,
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
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black,
                                                      )
                                                    ]),
                                                height:
                                                    ScreenSize.height! * 0.04,
                                                width: ScreenSize.width! * 1,
                                                child: Center(
                                                  child: Text(
                                                    "Tesks",
                                                    style: GoogleFonts
                                                        .zenKakuGothicNew(
                                                      textStyle:
                                                          const TextStyle(
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
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black,
                                                      )
                                                    ]),
                                                height:
                                                    ScreenSize.height! * 0.2,
                                                width: ScreenSize.width! * 1,
                                                child: ListView.builder(
                                                  itemCount:
                                                      reportModel.tasks!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius: const BorderRadius
                                                              .only(
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              topLeft: Radius
                                                                  .circular(30),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          30))),
                                                      margin:
                                                          const EdgeInsets.all(
                                                              10),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Text.rich(TextSpan(
                                                          text:
                                                              "${index + 1}- ${reportModel.tasks![index].toString()}",
                                                          style:
                                                              const TextStyle())),
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
                                                isObservations =
                                                    !isObservations!;
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black,
                                                      )
                                                    ]),
                                                height:
                                                    ScreenSize.height! * 0.04,
                                                width: ScreenSize.width! * 1,
                                                child: Center(
                                                  child: Text(
                                                    "Observations",
                                                    style: GoogleFonts
                                                        .zenKakuGothicNew(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 18),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              isObservations! ? true : false,
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
                                                  reportModel.observations
                                                      .toString(),
                                                  style: GoogleFonts.acme()),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                             setState((){
                                               reportModelVariable = reportModel ;
                                            });
                                             try{
                                               await createAndSavePDF(context: context , reportModel: reportModel, userModel:  widget.userModel, adminModel:adminModel);
                                             }catch(exception){
                                               debugPrint("The exception is : $exception");
                                             }
                                          },
                                          child: const Text("Download Pdf"),
                                        )
                                      ],
                                    ),
                                  );
                          },
                        )
                      : Center(child: Text("No Report found"));
              }
            },
          )),
    );
  }
}
