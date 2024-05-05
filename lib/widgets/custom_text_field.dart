import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
   final String? hintsText ;
   final int? maxLines ;
   final Widget? lable ;
   final Widget? prefixIcon;
   final Widget? suffixIcon;
   final BorderRadius borderRadius;
   final TextEditingController? controller ;
    const CustomTextField({super.key, required this.controller, required this.hintsText,  required this.maxLines, this.lable, this.prefixIcon, required this.borderRadius, this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      maxLines:widget.maxLines,
      minLines: 1,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        label: widget.lable,
          hintText: widget.hintsText,
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius,
          )
      ),
    );
  }
}
