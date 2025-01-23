import 'dart:io';


import 'package:url_launcher/url_launcher.dart';



class CustomLaunchUrl {
  ///launchUrlWhatsapp
  static Future<void> launchUrlWhatsapp(
      {required numPhone,
      required String name,
     }) async {
// String num='966';
    var androidUrl =
        "whatsapp://send?phone=+$numPhone&text=Flowery rider \n $name\n"
        // " $linkImage$urlPreview "
        ;
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse(name)}";
    var desktopUrl =
        "https://wa.me/$numPhone/?text=${Uri.parse(name)}&type=+$numPhone&app_absent=1";
    var webUrl = "https://web.whatsapp.com/send?phone=+$numPhone&text=$name";

    try {
      if (Platform.isIOS) {
        await launchUrl(
          Uri.parse(iosUrl),
        );
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      } else if (Platform.isWindows) {
        await launchUrl(Uri.parse(desktopUrl));
      } else {
        await launchUrl(Uri.parse(webUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }



  ///launchUrlCall
  static Future<void> launchUrlCall(
      {required numPhone, String? messageSms}) async {
    var androidUrl = 'tel:$numPhone';
    var iosUrl = 'tel:$numPhone';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }


}
