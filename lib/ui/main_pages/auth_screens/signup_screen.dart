import 'dart:io';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/auth_screens/signup_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../widgets/custom_widgets/custom_error_dialog.dart';
import '../../../widgets/email_password_validator.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static  File? imagePath;
  static String? verify;
  static String? imageDownloadUrl;
  static String? phoneNumber;
 static  TextEditingController locationController = TextEditingController();
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final PageController controller = PageController(initialPage: 0);
  final ScrollController _controller = ScrollController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  ImagePicker picker = ImagePicker();

  // get current location
  // List<Placemark>? placeMarks;
  // String completeAddress = "";
  // Future getCurrentLocation() async {
  //   Position newPosition = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   SignUpScreen.position = newPosition;
  //   placeMarks = await placemarkFromCoordinates(SignUpScreen.position!.latitude,SignUpScreen.position!.longitude);
  //   Placemark pMark = placeMarks![0];
  //   completeAddress = "${pMark.subThoroughfare} ${pMark.subLocality} ${pMark.subAdministrativeArea} ${pMark.postalCode}  ${pMark.country} ${pMark.street} ${pMark.name}";
  //   SignUpScreen.locationController.text = completeAddress;
  // }
  Future<void> _requestPhotosPermission() async {
    if (await Permission.photos
        .request()
        .isGranted) {
       ("Permission photo isGranted");
    } else {
      await Permission.photos.request();
    }
  }
  Future<void> _requestLocationPermission () async {
    if (await Permission.location.isGranted){
       ("Permission location isGranted");
    }else {
      await Permission.location.request();
    }
  }
  Future<void> _imagePicker() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () async {
                      final imageFile =
                      await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        SignUpScreen.imagePath = File(imageFile!.path);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("From Gallery")),
                TextButton(
                    onPressed: () async {
                      final imageFile =
                      await picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        SignUpScreen.imagePath = File(imageFile!.path);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("From Camera")),
              ],
            ),
          );
        });
  }
  Future<void> _scrollPosition() async {
    await _controller.animateTo(1000.0,
        duration: const Duration(seconds: 5), curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    SignUpScreen.locationController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _controller,
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/TAQAUNIVERSLOGO.png",
                  width: 428,
                  height: 457,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF755DC1),
                        fontSize: 27,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          await _requestPhotosPermission();
                          await _imagePicker();
                        },
                        child: CircleAvatar(
                          maxRadius: 60.0,
                          backgroundImage: SignUpScreen.imagePath != null
                              ? FileImage(SignUpScreen.imagePath!)
                              : null,
                          child: SignUpScreen.imagePath == null
                              ? const Icon(Icons.add_a_photo_outlined)
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.indigo),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              controller: _numController,
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: '  +212',
                                labelStyle: TextStyle(
                                  color: Color(0xFF755DC1),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                                // enabledBorder: const OutlineInputBorder(
                                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                //   borderSide: BorderSide(
                                //     width: 1,
                                //     color: Color(0xFF837E93),
                                //   ),
                                // ),
                                // focusedBorder: const OutlineInputBorder(
                                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                //   borderSide: BorderSide(
                                //     width: 1,
                                //     color: Color(0xFF9F7BFF),
                                //   ),
                                // ),
                                // focusedErrorBorder: OutlineInputBorder(
                                //   borderRadius:
                                //   const BorderRadius.all(Radius.circular(10.0)),
                                //   borderSide: BorderSide(
                                //     width: 1.0,
                                //     color: Colors.red.shade200,
                                //   ),
                                // ),
                                // errorBorder: OutlineInputBorder(
                                //   borderRadius:
                                //   const BorderRadius.all(Radius.circular(10.0)),
                                //   borderSide: BorderSide(
                                //     width: 1,
                                //     color: Colors.red.shade200,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: TextFormField(
                                validator: (number) => isValidMoroccoPhoneNumber(number!),
                                cursorOpacityAnimates: true,
                                cursorHeight: 30,
                                showCursor: true,
                                autocorrect: false,
                                enabled: true,
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                // onFieldSubmitted: (number) {
                                //   setState(() {
                                //     phoneNumber = "+212$number";
                                //   });
                                //    (phoneNumber);
                                // },
                                onChanged: (value) {
                                  if (value.length == 9) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onTap: () {
                                  _scrollPosition();
                                },
                                controller: _phoneController,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 19.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                                  // labelText: 'Phone Number',
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF755DC1),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // enabledBorder: const OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                  //   borderSide: BorderSide(
                                  //     width: 1,
                                  //     color: Color(0xFF837E93),
                                  //   ),
                                  // ),
                                  // focusedBorder: const OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                  //   borderSide: BorderSide(
                                  //     width: 1,
                                  //     color: Color(0xFF9F7BFF),
                                  //   ),
                                  // ),
                                  // focusedErrorBorder: OutlineInputBorder(
                                  //   borderRadius:
                                  //   const BorderRadius.all(Radius.circular(10.0)),
                                  //   borderSide: BorderSide(
                                  //     width: 1.0,
                                  //     color: Colors.red.shade200,
                                  //   ),
                                  // ),
                                  // errorBorder: OutlineInputBorder(
                                  //   borderRadius:
                                  //   const BorderRadius.all(Radius.circular(10.0)),
                                  //   borderSide: BorderSide(
                                  //     width: 1,
                                  //     color: Colors.red.shade200,
                                  //   ),
                                  // ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 17.0,
                    ),
                    // SizedBox(
                    //   height: 56,
                    //   child: TextFormField(
                    //     validator: (location) => isValidLocation(location!),
                    //     onChanged: (value) {
                    //       if (value.endsWith(".com")) {
                    //         FocusScope.of(context).nextFocus();
                    //       }
                    //     },
                    //     onTap: () {
                    //       _scrollPosition();
                    //     },
                    //     controller: SignUpScreen.locationController,
                    //     textAlign: TextAlign.center,
                    //     style: const TextStyle(
                    //       color: Color(0xFF393939),
                    //       fontSize: 13,
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     decoration: InputDecoration(
                    //       suffixIcon: IconButton(onPressed: () async{
                    //         await _requestLocationPermission();
                    //         // await getCurrentLocation();
                    //       }, icon: const Icon(Icons.my_location)),
                    //       labelText: 'Restaurant Location',
                    //       labelStyle: const TextStyle(
                    //         color: Color(0xFF755DC1),
                    //         fontSize: 15,
                    //         fontFamily: 'Poppins',
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide: BorderSide(
                    //           width: 1,
                    //           color: Color(0xFF837E93),
                    //         ),
                    //       ),
                    //       focusedBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide: BorderSide(
                    //           width: 1,
                    //           color: Color(0xFF9F7BFF),
                    //         ),
                    //       ),
                    //       focusedErrorBorder: OutlineInputBorder(
                    //         borderRadius:
                    //         const BorderRadius.all(Radius.circular(10.0)),
                    //         borderSide: BorderSide(
                    //           width: 1.0,
                    //           color: Colors.red.shade200,
                    //         ),
                    //       ),
                    //       errorBorder: OutlineInputBorder(
                    //         borderRadius:
                    //         const BorderRadius.all(Radius.circular(10.0)),
                    //         borderSide: BorderSide(
                    //           width: 1,
                    //           color: Colors.red.shade200,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 17.0,
                    // ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (SignUpScreen.imagePath != null){
                              if (_globalKey.currentState!.validate()){
                                setState(() {
                                 SignUpScreen.phoneNumber = "+212${_phoneController.text.trim()}";
                                   (SignUpScreen.phoneNumber );
                                });
                                Navigator.of(context).push(PageTransition(
                                  child: const SignUpScreen2(),
                                  type: PageTransitionType.rightToLeft,
                                ));
                                // BlocProvider.of<PhoneVerificationBloc>(context).add(SendOtpToPhoneEvent(phoneNumber: phoneNumber.toString()));
                              }else {
                                return  showDialog(context: context, builder: (context)=>const ErrorDialog(message: "Some Field not valid",));
                              }
                            }else {
                              return  showDialog(context: context, builder: (context)=>const ErrorDialog(message: "Please select Image",));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff9F7BFF)),
                          child: const Icon(Icons.arrow_forward, size: 30,color: Colors.black,),
                        )
                        // BlocConsumer<PhoneVerificationBloc, AuthState>(
                        //   listener: (context, state) async{
                        //     if (state is VerificationScreeOtpSuccessState){
                        //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Congratilation Your Phone Verified Seccessfully")));
                        //            (firebaseAdmin?.uid);
                        //     }else if (state is VPhoneLoadedState){
                        //       //TODO save imagePath to firebaseStorage
                        //         final filePath = SignUpScreen.imagePath;
                        //         final file = filePath;
                        //         final SettableMetadata metadata =
                        //         SettableMetadata(
                        //             contentType: "image/jpeg");
                        //         final Reference storageRef =
                        //         FirebaseStorage.instance.ref();
                        //         final imagePath = storageRef
                        //             .child("Seller/${auth.currentAdmin?.uid}/image.jpeg");
                        //         UploadTask uploadTask = imagePath.putFile(file!, metadata);
                        //         uploadTask.whenComplete((){});
                        //         String url = await imagePath.getDownloadURL();
                        //          (url);
                        //         setState(()  {
                        //           imageDownloadUrl = url.toString() ;
                        //         });
                        //         uploadTask.snapshotEvents
                        //             .listen((taskSnapshot) async {
                        //           switch (taskSnapshot.state) {
                        //             case TaskState.running:
                        //                 const Center(child: SizedBox(
                        //                  height: 100,
                        //                  width: 100,
                        //                  child: Text("Data Loading..."),
                        //                ),);
                        //               break;
                        //             case TaskState.paused:
                        //                ("paused.....");
                        //               break;
                        //             case TaskState.success:
                        //                 ("the image was puted seccussfully");
                        //               break;
                        //             case TaskState.canceled:
                        //                ("canceld......");
                        //               break;
                        //             case TaskState.error:
                        //                ("error........");
                        //               break;
                        //           }
                        //         });
                        //         //TODO save the info to FirebaseFireStore
                        //         if (SplashScreen.isLogin == true){
                        //            ("firebaseAdmin != null -------------------");
                        //           await _saveInfoToFireStore();
                        //           Navigator.of(context).push(
                        //               PageTransition(child: const HomeScreen(), type: PageTransitionType.rightToLeft)
                        //           );
                        //         }else {
                        //            ("the firebaseAdmin == null .............................");
                        //         }
                        //
                        //     }else if (state is VPhoneErrorState){
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                        //     }else if (state is PhoneAuthCodeSendSuccess){
                        //        Navigator.of(context).push(
                        //          PageTransition(child: const VerifyScreen(), type: PageTransitionType.rightToLeft)
                        //        );
                        //     }
                        //   },
                        //   builder: (context, state) {
                        //     return ElevatedButton(
                        //       onPressed: () async {
                        //          (phoneNumber);
                        //         if (SignUpScreen.imagePath != null){
                        //           if (_globalKey.currentState!.validate()){
                        //             PageTransition(
                        //               child:SignUpScreen2(),
                        //               type: PageTransitionType.rightToLeft,
                        //             );
                        //             // BlocProvider.of<PhoneVerificationBloc>(context).add(SendOtpToPhoneEvent(phoneNumber: phoneNumber.toString()));
                        //           }
                        //         }else {
                        //          return  showDialog(context: context, builder: (context)=>const ErrorDialog(message: "Please select Image",));
                        //         }
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: const Color(0xff9F7BFF)),
                        //       child:  Text(
                        //         state is VPhoneLoadingState ? "....." : "Send Code",
                        //         style: const  TextStyle(
                        //             fontSize: 13.0,
                        //             fontWeight: FontWeight.w600,
                        //             color: Colors.white),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      children: [
                        const Text(
                          ' have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF837E93),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                              duration: const Duration(milliseconds: 300),
                              reverseDuration:
                              const Duration(milliseconds: 300),
                              type: PageTransitionType.leftToRight,
                              child: const LoginScreen(),
                              curve: Curves.ease,
                            ));
                            // widget.controller?.animateToPage(2,
                            //     duration: const Duration(milliseconds: 500),
                            //     curve: Curves.ease);
                          },
                          child: const Text(
                            'Log In ',
                            style: TextStyle(
                              color: Color(0xFF755DC1),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const Row(
                    //   children: [
                    //     Text(
                    //       ' have an account?',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Color(0xFF837E93),
                    //         fontSize: 13,
                    //         fontFamily: 'Poppins',
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 2.5,
                    //     ),
                    //     // InkWell(
                    //     //   onTap: () {
                    //     //     Navigator.of(context).push(PageTransition(
                    //     //       duration: const Duration(milliseconds: 300),
                    //     //       reverseDuration:
                    //     //       const Duration(milliseconds: 300),
                    //     //       type: PageTransitionType.leftToRight,
                    //     //       child: const LoginScreen(),
                    //     //       curve: Curves.ease,
                    //     //     ));
                    //     //     // widget.controller?.animateToPage(2,
                    //     //     //     duration: const Duration(milliseconds: 500),
                    //     //     //     curve: Curves.ease);
                    //     //   },
                    //     //   child: const Text(
                    //     //     'Log In ',
                    //     //     style: TextStyle(
                    //     //       color: Color(0xFF755DC1),
                    //     //       fontSize: 13,
                    //     //       fontFamily: 'Poppins',
                    //     //       fontWeight: FontWeight.w500,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
