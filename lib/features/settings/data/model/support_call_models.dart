import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class SupportCallModels {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final Uri url;

  SupportCallModels({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.url,
  });
}

List<SupportCallModels> supportCallList({required BuildContext context}) {
  final s = S.of(context);
  return [
    SupportCallModels(
      title: s.supportPhoneHint,
      subTitle: s.supportPhoneHint,
      icon: Icons.phone,
      iconColor: Colors.blue,
      url: Uri.parse("tel:+201093991564"),
    ),
    SupportCallModels(
      title: s.supportWhatsappTitle,
      subTitle: s.supportWhatsappHint,
      icon: Icons.chat,
      iconColor: Colors.green,
      url: Uri.parse(
        "https://wa.me/+201093991564?text=مرحبا%20فريق%20الدعم%20",
      ),
    ),
    SupportCallModels(
      title: s.supportEmailTitle,
      subTitle: s.supportEmailHint,
      icon: Icons.email,
      iconColor: Colors.red,
      url: Uri.parse("mailto:support@example.com"),
    ),
  ];
}
