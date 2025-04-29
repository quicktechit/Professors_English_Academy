import 'package:professors_english_academy/consts/consts.dart';

Widget customTextField(
    {icon,
      controller,
      required String hint,
      required bool isSuffix,
      suIcon,keyboard,
      required bool isVisible,
      suppixtap}) {
  return TextField(
    obscureText: !isVisible,
    // style:  GoogleFonts.basic(
    //   color: mainColor,
    // ),
    controller: controller,keyboardType: keyboard??TextInputType.text,
    decoration: InputDecoration(
        contentPadding:EdgeInsets.only(left:15,top: 10,bottom: 10 ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black), // Border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: mainColor,width: 1.5)),
        isDense: true,
        prefixIcon:icon==null?null: Icon(
          icon,
          color: mainColor.withOpacity(0.7),
          size: 27,
        ),
        hintText: hint.tr,
        // hintStyle:  GoogleFonts.basic(color: mainColor, fontSize: 14),
        suffixIcon: isSuffix
            ? Icon(
          suIcon,
          color: mainColor.withOpacity(0.7),
          size: 24,
        ).onTap(suppixtap)
            :null),
  );
}
