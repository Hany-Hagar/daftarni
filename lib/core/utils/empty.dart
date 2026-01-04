import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text.dart';

enum EState { list, search, home }

class Empty extends StatelessWidget {
  final EState state;
  const Empty({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      EState.list => const _List(),
      EState.search => const _Search(),
      EState.home => const _Home(),
    };
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.4,
          "assets/lotties/empty.json",
        ),
        CustomText(isHead: true, fontSize: 20, title: S.of(context).emptyList),
      ],
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          "assets/lotties/No Search Results.json",
        ),
      ],
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.4,
      "assets/lotties/empty.json",
    );
  }
}
