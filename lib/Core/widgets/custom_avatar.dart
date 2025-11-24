import 'dart:io';
import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../../features/settings/presentation/manager/settings_states.dart';

class CustomAvatar extends StatelessWidget {
  final double radius;
  final bool clapping;

  const CustomAvatar({super.key, required this.radius, this.clapping = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        var data = ServiceLocator.getDataModel().profile;
        var imageUrl = data.imageUrl;
        var imagePath = data.imagePath;
        return ClipOval(
          clipBehavior: clapping ? Clip.hardEdge : Clip.none,
          child: SizedBox(
            width: radius * 2,
            height: radius * 2,
            child:
                imagePath.isNotEmpty
                    ? Image.file(
                      File(imagePath),
                      fit: BoxFit.cover, // الصورة تملأ الدايرة بالكامل
                    )
                    : imageUrl.isEmpty
                    ? const _AssetAvatar()
                    : _NetWorkAvatar(imageUrl: imageUrl, radius: radius),
          ),
        );
      },
    );
  }
}

class _NetWorkAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  const _NetWorkAvatar({required this.radius, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: radius * 2,
        height: radius * 2,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => Center(
              child: SizedBox(
                width: radius / 1.5,
                height: radius / 1.5,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        errorWidget: (context, url, error) => const _AssetAvatar(),
      ),
    );
  }
}

class _AssetAvatar extends StatelessWidget {
  const _AssetAvatar();

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/UserIcon.png", fit: BoxFit.cover);
  }
}
