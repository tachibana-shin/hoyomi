import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../interfaces/export.dart';
import '../service.dart';

class AvatarService extends StatelessWidget {
  final Service service;
  final double radius;

  const AvatarService(this.service, {super.key, this.radius = 6.0});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(
        service.faviconUrl.src,
        headers: service.faviconUrl.headers?.toMap(),
      ),
    );
  }
}
