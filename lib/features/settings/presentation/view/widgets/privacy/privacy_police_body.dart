import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../../../../const_data/data.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_card.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/services/service_locator.dart';

class PrivacyPoliceBody extends StatelessWidget {
  const PrivacyPoliceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        CustomCard(
          emoji: "🔒",
          title: S.of(context).privacySecurityTitle,
          sizeBoxHeight: 5,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            isHead: true,
            maxLines: 8,
            fontSize: 20,
            title: S.of(context).privacySecurityIntro,
          ),
        ),
        CustomCard(
          emoji: "🧾",
          title: S.of(context).privacySecurityFirstTitle,
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            maxLines: 5,
            title: S.of(context).privacySecurityFirstText,
          ),
        ),
        CustomCard(
          emoji: "💾",
          title: S.of(context).privacySecuritySecondTitle,
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            maxLines: 5,
            title: S.of(context).privacySecuritySecondText,
          ),
        ),
        CustomCard(
          emoji: "🧠",
          title: S.of(context).privacySecurityThirdTitle,
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            maxLines: 5,
            title: S.of(context).privacySecurityThirdText,
          ),
        ),
        CustomCard(
          emoji: "🔐",
          title: S.of(context).privacySecurityFourthTitle,
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            maxLines: 5,
            title: S.of(context).privacySecurityFourthText,
          ),
        ),
        CustomCard(
          emoji: "⚙️",
          title: S.of(context).privacySecurityFifthTitle,
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: CustomText(
            maxLines: 5,
            title: S.of(context).privacySecurityFifthText,
          ),
        ),
        CustomCard(
          emoji: "📧",
          title: S.of(context).privacySecurityContactTitle,
          padding: EdgeInsetsDirectional.only(
            start: 12.0,
            end: 12.0,
            top: 12.0,
            bottom: 2.0,
          ),
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(title: S.of(context).privacySecurityContactText),
              TextButton(
                onPressed: () {},
                child: CustomText(
                  isHead: true,
                  fontSize: 18,
                  maxLines: 2,
                  fontColor: const Color.fromARGB(255, 1, 40, 108),
                  title: appEMail,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(title: S.of(context).privacySecurityFooter),
            CustomText(
              title:
                  "  ${DateFormat('y', ServiceLocator.getDataModel().preferences.languageCode).format(DateTime.now()).toString()} ©",
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
