import 'package:kodland_app/config/number.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchWhatsapp(Number number) async {
    String uri = 'http://wa.me/${number.prefix}${number.number}';
    Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } 
  
}