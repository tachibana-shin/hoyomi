import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/router/extensions/to_router.dart';

import '../card_horz_item.dart';

class HorizontalEiga extends StatelessWidget {
  final Eiga eiga;
  final String sourceId;
  final bool replace;

  const HorizontalEiga({
    super.key,
    required this.eiga,
    required this.sourceId,
    this.replace = false,
  });

  @override
  Widget build(BuildContext context) {
    return CardHorzItem(
      to: ToRoute(
        name: 'details_eiga',
        pathParameters: {'sourceId': sourceId, 'eigaId': eiga.eigaId},
      ),
      replace: replace,
      sourceId: sourceId,
      rate: eiga.rate,
      image: eiga.image,
      notice: eiga.notice,
      progress: null,
      pending: false,
      preRelease: null,
      title: eiga.name,
      subtitle2: eiga.originalName,
      subtitle: eiga.lastEpisode?.name,
      lastUpdate: eiga.lastUpdate,
      extend: const [],
    );
  }
}
