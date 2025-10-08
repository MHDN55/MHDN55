import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlStringSafe(String? url) async {
  if (url == null || url.isEmpty) return;
  try {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (_) {}
}