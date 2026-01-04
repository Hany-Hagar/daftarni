import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/settings/settings_top.dart';
import '../widgets/settings/settings_body.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_avatar.dart';
import '../../../../../core/services/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height / 6.7;

    return BackGround(
      body: Stack(
        children: [
          Column(children: [const SettingsTop(), const SettingsBody()]),
          Transform.translate(offset: Offset(0, h), child: _UserCard()),
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    var user = ServiceLocator.getDataModel().profile;
    final email = user.emailAddress.isEmpty ? s.notSignedIn : user.emailAddress;

    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListTile(
        minTileHeight: 80,
        tileColor: Colors.transparent,
        leading: CustomAvatar(radius: 26.r),
        title: CustomText(isHead: true, fontSize: 20, title: user.userName),
        subtitle: CustomText(title: email, fontSize: 20),
        onTap: () {},
      ),
    );
  }
}
