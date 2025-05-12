import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
import 'package:hoyomi/router/index.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../service.dart';

const _statusCaptchaResolve = [429, 503, 403];

mixin CaptchaResolverMixin on Service {
  static responseIsCaptchaResolve(Response response) {
    return _statusCaptchaResolve.contains(response.statusCode);
  }

  static buildWidget(
    BuildContext? context, {
    bool isSnackbar = false,
    required CaptchaRequiredException error,
    String? url,
  }) {
    return Padding(
      padding:
          isSnackbar
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Iconify(
                Mdi.earth,
                color:
                    isSnackbar || context == null
                        ? Colors.black
                        : Theme.of(context).colorScheme.onSurface,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Please resolve Captcha to continue.'),
                    if (url != null)
                      Text(
                        url,
                        style: TextStyle(fontSize: 14.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            child: Text('Go to Captcha'),
            onPressed: () async {
              await router.push('/webview/${error.service.uid}');
              router.refresh();
            },
          ),
        ],
      ),
    );
  }

  static void showSnackCaptcha(
    BuildContext? context, {
    String? url,
    required CaptchaRequiredException error,
    required StackTrace trace,
  }) {
    showSnackBar(
      buildWidget(context, isSnackbar: true, url: url, error: error),
    );
  }
}
