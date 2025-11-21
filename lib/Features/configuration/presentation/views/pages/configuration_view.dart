import 'package:flutter/material.dart';
import '../widgets/configuration_body.dart';
import '../../../../../Core/widgets/back_ground.dart';

class ConfigurationView extends StatelessWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: SizedBox(height: MediaQuery.of(context).padding.top + 5),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(child: ConfigurationBody()),
      ),
    );
  }
}
