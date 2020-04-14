import 'package:flutter/foundation.dart';
//import 'dart:html' as html;

void openLink(String url, String name) async {
  if (kIsWeb) {
    //html.window.open(url, "Registration");
  } /*else if (await canLaunch(url)) {
    await launch(url);
  } else {
    ToastUtils.showToast(message: 'Couldnt open link');
  }*/
}
