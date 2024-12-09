import 'package:flutter/material.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/stores.dart';
import 'package:honyomi/widgets/horizontal_book_list.dart';
import 'package:honyomi/widgets/vertical_book_list.dart';

class TabView extends StatefulWidget {
  final BaseService service;

  const TabView({super.key, required this.service});

  @override
  // ignore: library_private_types_in_public_api
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Future<Iterable<BasicSection>> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.service.home();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<Iterable<BasicSection>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          if (widget.service.isCaptchaError(snapshot.error)) {
            return Center(
                child: widget.service.templateCaptchaResolver(context));
          }

          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, sectionIndex) {
            final section = snapshot.data!.elementAt(sectionIndex);

            return ValueListenableBuilder<bool>(
                valueListenable: isGridViewEnabled,
                builder: (context, value, _) {
                  if (value == false) {
                    return HorizontalBookList(
                      booksFuture: Future.value(section.books),
                      service: widget.service,
                      title: section.name,
                      more: section.sectionId != null
                          ? '/section/${widget.service.uid}/${section.sectionId}'
                          : null,
                    );
                  }

                  return VerticalBookList(
                    booksFuture: null,
                    books: section.books,
                    service: widget.service,
                    title: section.name,
                    more: section.sectionId != null
                        ? '/section/${widget.service.uid}/${section.sectionId}'
                        : null,
                  );
                });
          },
        );
      },
    );
  }
}
