import 'dart:math';

import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/format_duration.dart';
import 'package:hoyomi/widgets/infinite_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class HistoryEigaPage extends StatefulWidget {
  final String sourceId;

  const HistoryEigaPage({
    super.key,
    required this.sourceId,
  });

  @override
  State<HistoryEigaPage> createState() => _HistoryEigaPageState();
}

class _HistoryEigaPageState extends State<HistoryEigaPage> {
  int _pageKey = 2;
  late final EigaHistoryMixin _service;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaHistoryMixin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History ${(_service as Service).name}'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return PullRefreshPage(
        onLoadData: () => _service.getWatchHistory(page: 1),
        onLoadFake: () => List.generate(
            30, (_) => HistoryItem.createFakeData(Eiga.createFakeData())),
        builder: (data, _) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: InfiniteList(
                data: data,
                fetchData: () async {
                  final result = await _service.getWatchHistory(page: _pageKey);
                  _pageKey++;

                  final isLastPage = result.isEmpty;

                  return (isLastPage, result);
                },
                itemBuilder: (context, history, index) {
                  final eiga = history.item;
                  final episode = history.lastEpisode;
                  final watchTime = history.watchTime;

                  return InkWell(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          decoration: BoxDecoration(
                              color: null,
                              borderRadius: BorderRadius.circular(7.0)),
                          padding: EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 7.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: min(180.0, 30.w(context)),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(children: [
                                      AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: OImage.network(
                                            eiga.image.src,
                                            sourceId: widget.sourceId,
                                            headers: eiga.image.headers,
                                            fit: BoxFit.cover,
                                          )),

                                      ///
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Column(children: [
                                            LinearProgressIndicator(
                                              value: watchTime
                                                      .position.inMilliseconds /
                                                  watchTime
                                                      .duration.inMilliseconds,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 255, 255, 0.6),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFF00C234)),
                                              minHeight: 3.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )
                                          ])),
                                    ])),
                                SizedBox(width: 7.0),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      eiga.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    Text(
                                      'Episode ${episode.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color
                                                  ?.withValues(alpha: 0.8)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    SizedBox(height: 2.0),

                                    ///
                                    Text(
                                      '${formatDuration(watchTime.position)} / ${formatDuration(watchTime.duration)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color
                                                  ?.withValues(alpha: 0.8)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5.0),
                                    if (episode.description?.isNotEmpty == true)
                                      Text(
                                        episode.description!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(fontSize: 12.0),
                                        maxLines: 2,
                                      )
                                  ],
                                ))
                              ])));
                })));
  }
}
