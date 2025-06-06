import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/constraints/fluent.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';

class SearchPage extends StatefulWidget {
  final String? from;

  const SearchPage({super.key, required this.from});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  late TabController _tabController;

  final _newsChoices = ['All', 'Comic', 'Eiga'];
  late final _newsChoice = ref(0);
  late final _newsSort = ref(false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex:
          (_newsChoice.value = (widget.from == 'eiga' ? 1 : 0) + 1) - 1,
      length: 2,
      vsync: this,
    )..addListener(() {
      context.replace(
        '/search?q=${globalKeyword.value}&from=${_tabController.index == 0 ? 'comic' : 'eiga'}',
      );
      _newsChoice.value = _tabController.index + 1;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: GlobalSearchBar(pageIsSearch: true),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Watch(
                () => Choice<int>.inline(
                  value: ChoiceSingle.value(_newsChoice.value),
                  onChanged: ChoiceSingle.onChanged((value) {
                    _newsChoice.value = value!;
                    if (_newsChoice.value >= 1) {
                      _tabController.animateTo(_newsChoice.value - 1);
                    }
                  }),
                  itemCount: _newsChoices.length,
                  itemBuilder: (state, i) {
                    return Disabled(
                      disabled: i == 0 && globalKeyword.value.trim().isNotEmpty,
                      child: ChoiceChip(
                        selected: state.selected(i),
                        onSelected: state.onSelected(i),
                        label: Text(_newsChoices[i]),
                      ),
                    );
                  },
                  listBuilder: ChoiceList.createScrollable(
                    spacing: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _newsSort.value = !_newsSort.value;
                },
                icon: Iconify(Fluent.colorNews24, iconColor: true),
                label: Watch(() => Text(_newsSort.value ? 'Sort' : 'News')),
              ).paddingOnly(right: 24.0),
            ],
          ),
        ),
      ),
      body: Watch(
        () => Stack(
          children: [
            if (globalKeyword.value.trim().isNotEmpty)
              _buildBodySearch(context)
            else
              _buildBodyGetStarting(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBodySearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ).copyWith(bottom: 0),
      child: TabBarView(
        controller: _tabController,
        children: [
          Watch(
            () => ComicSearchResults(
              key: ValueKey(globalKeyword.value),
              keyword: globalKeyword.value,
            ),
          ),
          Watch(
            () => EigaSearchResults(
              key: ValueKey(globalKeyword.value),
              keyword: globalKeyword.value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyGetStarting(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ).copyWith(bottom: 0),
      child: NewsFeedScreen(type: _newsChoice, sort: _newsSort),
    );
  }
}
