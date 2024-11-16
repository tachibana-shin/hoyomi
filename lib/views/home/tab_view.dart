// file: lib/views/tab_view.dart

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:honyomi/services/base_service.dart';
import 'package:honyomi/services/interfaces/basic_section.dart';
import 'package:honyomi/widgets/vertical_book.dart';

class TabView extends StatefulWidget {
  final BaseService service;

  const TabView({super.key, required this.service});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  late Future<Iterable<BasicSection>> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.service.home();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<BasicSection>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        double screenWidth = MediaQuery.of(context).size.width;
        int crossAxisCount;

        if (screenWidth <= 600) {
          crossAxisCount = 3;
        } else if (screenWidth <= 900) {
          crossAxisCount = 4;
        } else {
          crossAxisCount = 6;
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, sectionIndex) {
            final section = snapshot.data!.elementAt(sectionIndex);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        section.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (section.slug != null)
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            print("Navigating to ${section.slug}");
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  DynamicHeightGridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // padding: const EdgeInsets.all(8.0),
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10.0,
                    //   childAspectRatio: 1/3,
                    // ),
                    itemCount: section.books.length,
                    builder: (context, bookIndex) {
                      final book = section.books.elementAt(bookIndex);
                      return VerticalBook(book: book);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
