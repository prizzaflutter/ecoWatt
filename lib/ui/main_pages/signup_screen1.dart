
import 'package:ecowatt_yassine_askour_flutter/bloc/admin_bloc.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/email_password_validator.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController repassController = TextEditingController();

  @override
  State<SignUpScreen2> createState() => _SingUpScreen2State();
}

class _SingUpScreen2State extends State<SignUpScreen2> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final PageController controller = PageController(initialPage: 0);
  final ScrollController _controller = ScrollController();

  Future<void> _scrollPosition() async {
    await _controller.animateTo(1000.0,
        duration: const Duration(seconds: 5), curve: Curves.ease);
  }
  @override
  void dispose() {
    _controller.dispose();
    SignUpScreen2.nameController.dispose();
    SignUpScreen2.emailController.dispose();
    SignUpScreen2.passController.dispose();
    SignUpScreen2.repassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
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
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattLogobg.png",
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
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 56,
                      child: TextFormField(
                        validator: (name) => validateName(name!),
                        onChanged: (value) {
                          if (value.length > 8) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onTap: () {
                          _scrollPosition();
                        },
                        controller: SignUpScreen2.nameController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF9F7BFF),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.red.shade200,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red.shade200,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                      height: 56,
                      child: TextFormField(
                        validator: (email) => validateEmail(email!),
                        onChanged: (value) {
                          if (value.endsWith(".com")) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onTap: () {
                          _scrollPosition();
                        },
                        controller: SignUpScreen2.emailController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF9F7BFF),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.red.shade200,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red.shade200,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widthScreen / 3,
                          height: 56,
                          child: TextFormField(
                            validator: (password) =>
                                validatePassword(password!),
                            onTap: () {
                              _scrollPosition();
                            },
                            obscuringCharacter: "*",
                            obscureText: true,
                            controller: SignUpScreen2.passController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Create Password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF837E93),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              labelStyle: const TextStyle(
                                color: Color(0xFF755DC1),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF837E93),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF9F7BFF),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.red.shade200,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widthScreen / 3 ,
                          height: 56,
                          child: TextFormField(
                            validator: (confirmedPassword) =>
                                validatePassword(confirmedPassword!),
                            onTap: () {
                              _scrollPosition();
                            },
                            obscuringCharacter: "*",
                            obscureText: true,
                            controller: SignUpScreen2.repassController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Confirm Password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF837E93),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              labelStyle: const TextStyle(
                                color: Color(0xFF755DC1),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF837E93),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF9F7BFF),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.red.shade200,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: BlocConsumer<SignUpBloc, AdminState>(
                          listener: (context, state) {
                            if (state is DataLoadedState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("The Account has been Registered : We send a email Verification"),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              Navigator.of(context).pushReplacement(PageTransition(child:  const LoginScreen(), type: PageTransitionType.rightToLeft));
                            } else if (state is DataLoadingErrorSate) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text("SomeThing wrong : try later"),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                                onPressed: () async {
                                  if (SignUpScreen2.passController.text ==
                                      SignUpScreen2.repassController.text) {
                                    if (_globalKey.currentState!.validate()) {
                                      BlocProvider.of<SignUpBloc>(context).add(
                                          SignUpAdminEvent(
                                              email: SignUpScreen2
                                                  .emailController.text.trim(),
                                              password: SignUpScreen2
                                                  .passController.text.trim()));
                                      // await Navigator.of(context).push(
                                      //   PageTransition(
                                      //     child: const LoginScreen(),
                                      //     type: PageTransitionType.rightToLeft,
                                      //     duration:
                                      //         const Duration(milliseconds: 300),
                                      //     reverseDuration:
                                      //         const Duration(milliseconds: 300),
                                      //   ),
                                      // );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Password not Equal"),
                                      duration: Duration(seconds: 1),
                                    ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff9F7BFF)),
                                child: BlocBuilder<SignUpBloc, AdminState>(
                                  builder: (context, state) {
                                    return state is DataLoadingState
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            "Sign Up",
                                            style: TextStyle(color: Colors.white),
                                          );
                                  },
                                ));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
