import 'package:flutter/material.dart';
import 'package:hoyomi/widgets/iconify.dart';

class ButtonInset extends StatelessWidget {
  final String text;
  final String icon;
  final bool disabled;
  final void Function() onPressed;

  const ButtonInset({
    super.key,
    required this.text,
    required this.icon,
    this.disabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disabled) onPressed();
      },
      borderRadius: BorderRadius.all(Radius.circular(100.0)),
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(icon, size: 24),
              SizedBox(height: 2),
              Text(
                text,
                maxLines: 1,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(
              //     height: 12 * 1.5,
              //     child: Marquee(
              //       text: text,
              //       style: TextStyle(fontSize: 12),
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       blankSpace: 20.0,
              //       velocity: 25.0,
              //       startPadding: 0.0,
              //       pauseAfterRound: Duration(seconds: 1),
              //       showFadingOnlyWhenScrolling: true,
              //       fadingEdgeStartFraction: 0.1,
              //       fadingEdgeEndFraction: 0.1,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
