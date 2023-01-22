import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Feature {
  static String getGreetingByTime() {
    var dt = DateTime.now();
    if (dt.hour < 11) {
      return "Good morning";
    } else if (dt.hour < 18) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }

  static Future<void> openGoogleMaps() async {
    String url =
        "https://www.google.com/maps/place/Rumah+Makan+Metro+Baru+Jambi/@-1.5909668,103.613358,17z/data=!3m1!4b1!4m5!3m4!1s0x2e2589207baabd85:0x32d25f97cd43fbff!8m2!3d-1.5910157!4d103.615567";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openPhone() async {
    String url = "tel:074127845";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
