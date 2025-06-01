import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/logo.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
import 'package:hoyomi/router/index.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';

import '../widget/avatar_service.dart';
import 'headless_mixin.dart';

const _statusCaptchaResolve = [429, 503, 403];

mixin CaptchaResolverMixin on HeadlessMixin {
  static final _servicesNeedResolve = Ref<Set<Service>>({});

  static bool responseIsCaptchaResolve(Response response) {
    return _statusCaptchaResolve.contains(response.statusCode);
  }

  static Widget buildWidget(
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
              await router.pushNamed('webview', pathParameters: {'sourceId': error.service.uid});
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

  static void showGeneralDialog() {
    showDialog(
      context: shellRouteKey.currentContext!,
      builder:
          (context) => AlertDialog(
            title: Text('Captcha Required'),
            content: ListView.builder(
              shrinkWrap: true,
              itemCount: _servicesNeedResolve.value.length,
              itemBuilder: (context, index) {
                final service = _servicesNeedResolve.value.elementAt(index);

                return InkWell(
                  enableFeedback: true,
                  focusColor: Colors.transparent,
                  child: Row(
                    children: [
                      AvatarService(service, radius: 7.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(service.name),
                          Text(
                            service.baseUrl,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.85),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ).expanded(),

                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Iconify(Logo.hCaptcha),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 16.0, horizontal: 16.0),
                );
              },
            ),
            actions: [
              TextButton(
                child: Text('Go to Captcha'),
                onPressed: () async {
                  // await router.push('/webview/${error.service.uid}');
                  // router.refresh();
                },
              ),
            ],
          ),
    );
  }

  Future<String> retryWithHeadless(
    String url, {
    Map<String, dynamic>? body,
    required Headers headers,
    bool notify = true,
  }) {
    _servicesNeedResolve.value = {
      ..._servicesNeedResolve.value..add(this as Service),
    };
    showGeneralDialog();

    return fetchHeadless(url, body: body, headers: headers, notify: notify);
  }
}
