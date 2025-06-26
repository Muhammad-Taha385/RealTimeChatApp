import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_time_chat_application/core/constants/colors.dart';
// // import 'package:real_time_chat_application/core/constants/styles.dart';
// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     this.hintText,
//     this.onChanged,
//     this.focusNode,
//     this.controller,
//     this.prefixIcon,
//     this.isObscure
//   });
//   final String? hintText;
//   final void Function(String)? onChanged;
//   final FocusNode? focusNode;
//   final TextEditingController? controller ;
//   final Icon? prefixIcon;
//   final bool? isObscure;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 10.w),
//       child: TextField(
//         obscureText: ,
//         controller:controller ,
//         onChanged:onChanged ,
//         focusNode:focusNode,
//         decoration: InputDecoration(
//           prefixIcon:prefixIcon ,
          
//           hintText: hintText,
//           hintStyle: TextStyle(
//             fontWeight: FontWeight.w300,
//             fontSize: 14
//           ),
//           filled: true,
//           fillColor: grey.withOpacity(0.2),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius:BorderRadius.circular(10.r)
//           )
      
//         ),
//       ),
//     );
//   }
// }
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.prefixIcon,
    this.isObscure = false, // default to false
    this.validate
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final bool isObscure;
  final String? Function(String?)? validate;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: TextFormField(
        validator: widget.validate ,
        obscureText: _obscureText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          // focusedBorder: Colors.black,
          // focusColor: Colors.black,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isObscure
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
          filled: true,
          fillColor: grey.withOpacity(0.2),
        //   enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade600),
        //   borderRadius: BorderRadius.circular(10.r),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
        //   borderRadius: BorderRadius.circular(10.r),
        // ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
            
          ),
        ),
      ),
    );
  }
}
