
String? validateEmail ( String email){
  String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(email)){
    return "Enter a valid email address";
  }
  return null;
}
String? validatePassword (String password){
  if (password.length < 8){
    return "Password must be at least 8 characters";
  }
  if (!password.contains(RegExp(r'[A-Z]'))){
    return "Password must contain at least one uppercase letter";
  }
  if (!password.contains(RegExp(r'[a-z]'))){
    return "Password must contain at least one lowercase letter";
  }
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    return "Password must contain at least one special character";
  }
  return null ;
}
String? validateName (String name ){
  if (name.isEmpty){
    return "name is required";
  }
  if (name.length < 5){
    return "name must be at least 5 characters";
  }
  if (name.contains(RegExp(r'[1-9]'))){
    return "name contains numbers!!";
  }
  if (name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    return "name contains characters!!!";
  }
  return null ;
}
//  validateImage () async {
//   if (SignUpScreen.imagePath == null){
//        return Builder(builder: (context){
//          return const ErrorDialog(
//            message: "Please select image",
//          );
//        //    return showDialog(context: context, builder: (context){
//        //      return  ErrorDialog(
//        //        message: "Please select image",
//        //      );
//        // });
//      }
//      );
//   }else {
//     return const ErrorDialog(
//       message: "Nice Your Image very cool",
//     );
//   }
// }

String? isValidMoroccoPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters
  // String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the cleaned number starts with the Morocco country code (+212)
  // if (cleanedNumber.startsWith('+212')) {
  //   // Remove the country code for further validation
  //   cleanedNumber = cleanedNumber.substring(4);

    // Check the length of the cleaned number after removing the country code
    // if (cleanedNumber.length == 9) {
    //   // Ensure that the remaining characters are all digits
    //   return RegExp(r'^\d+$').hasMatch(cleanedNumber).toString();
    // // }
    if (phoneNumber.isEmpty){
      return" phone number is required";
    } else if (phoneNumber.length != 9){
      return "phone number must be 9 digitals";
    }
    return null;
  }

String? isValidLocation(String location)  {
  if (location.isEmpty){
    return "Location is Required";
  }else if (location.length<10){
    return "Location must at less 10 characters";
  }
  return null;
}