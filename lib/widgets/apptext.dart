import 'package:flutter/widgets.dart';

class AppText extends StatelessWidget {
  String? title;
  double? textsize;
  Color? textcolor;
  FontWeight? textfw;
   AppText({
    this.textcolor,
    this.textfw,
    this.textsize,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("$title",style: TextStyle(color: textcolor,fontSize: textsize,fontWeight: textfw),);
  }
}