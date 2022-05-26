import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class Fun{
  static void openLink(var Url) async {
    if (!await launchUrl(Uri.parse(Url))) throw 'Could not launch $Url';
  }

  static void ShareLink(var Url) async {
    Share.share('$Url', subject: 'Look what I made!');
  }
  static Future<void> copyLink(var Url) async {
    FlutterClipboard.copy(Url)//.then(( value ) => print('copied'))
    ;
  }

}