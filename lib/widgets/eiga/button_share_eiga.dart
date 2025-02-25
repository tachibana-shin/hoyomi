import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:share_plus/share_plus.dart';

class ButtonShareEiga extends StatefulWidget {
  final ValueNotifier<String> eigaId;
  final ValueNotifier<String> episodeName;
  final ValueNotifier<MetaEiga> metaEiga;
  final Service service;

  const ButtonShareEiga({
    super.key,
    required this.eigaId,
    required this.episodeName,
    required this.metaEiga,
    required this.service,
  });

  @override
  State<ButtonShareEiga> createState() => _ButtonShareEigaState();
}

class _ButtonShareEigaState extends State<ButtonShareEiga> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.eigaId,
      builder:
          (context, eigaId, _) => ElevatedButton.icon(
            onPressed: () {
              final title =
                  '${widget.episodeName.value} ${widget.metaEiga.value.name}, ${widget.metaEiga.value.originalName}';
              Share.share('Watch $title on Hoyomi: ', subject: title);
            },
            icon: Icon(
              MaterialCommunityIcons.share_outline,
              color: Theme.of(context).textTheme.labelLarge?.color,
            ),
            label: Text(
              'Share',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
            ),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              ),
            ),
          ),
    );
  }
}
