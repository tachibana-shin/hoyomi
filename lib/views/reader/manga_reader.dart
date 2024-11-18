import 'package:flutter/material.dart';
import 'package:honyomi/services/interfaces/basic_image.dart';

class MangaReader extends StatefulWidget {
  final Iterable<BasicImage> mangaPages;
  const MangaReader({super.key, required this.mangaPages});

  @override
  _MangaReaderState createState() => _MangaReaderState();
}

class _MangaReaderState extends State<MangaReader> {
  int _currentPage = 0;
  int _mode = 0; // 0: Scroll, 1: Swipe Left, 2: Swipe Right
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  late List<bool> _isImageLoaded;

  double _dragStartPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _isImageLoaded = List.generate(widget.mangaPages.length, (index) => false);
    _lazyLoadImages();
  }

  void _changeMode(int mode) {
    setState(() {
      _mode = mode;
    });
  }

  void _lazyLoadImages() {
    setState(() {
      for (int i = 0; i < widget.mangaPages.length; i++) {
        if ((i - _currentPage).abs() <= 2) {
          _isImageLoaded[i] = true;
        }
      }
    });
  }

  void _scrollToPosition(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page ${_currentPage + 1} / ${widget.mangaPages.length}',
        ),
      ),
      body: _buildReader(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProgressControl(),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.vertical_align_center),
                label: 'Scroll',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.swipe_left),
                label: 'Swipe Left',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.swipe_right),
                label: 'Swipe Right',
              ),
            ],
            currentIndex: _mode,
            onTap: (index) => _changeMode(index),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressControl() {
    return Slider(
      value: _currentPage.toDouble(),
      min: 0,
      max: (widget.mangaPages.length - 1).toDouble(),
      onChanged: (value) {
        setState(() {
          _currentPage = value.toInt();
          if (_mode == 0) {
            _scrollToPosition(
                _currentPage * MediaQuery.of(context).size.height);
          } else {
            _pageController.jumpToPage(_currentPage);
          }
          _lazyLoadImages();
        });
      },
    );
  }

  Widget _buildReader() {
    if (_mode == 0) {
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final position = _scrollController.position.pixels;
            final height = MediaQuery.of(context).size.height;
            final page = (position / height).round();
            if (page != _currentPage) {
              setState(() {
                _currentPage = page;
              });
            }
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.mangaPages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(
                widget.mangaPages.elementAt(index).src,
                headers: widget.mangaPages.elementAt(index).headers,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      );
    } else {
      return Listener(
          onPointerDown: (event) {
            _dragStartPosition = event.position.dx;
          },
          onPointerMove: (event) {
            final delta = event.position.dx - _dragStartPosition;
            if (delta.abs() > 20) {
              if (delta < 0) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            }
          },
          child: PageView.builder(
            controller: _pageController,
            reverse: _mode == 2, // Reverse for swipe right
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
                _lazyLoadImages();
              });
            },
            itemCount: widget.mangaPages.length,
            itemBuilder: (context, index) {
              if (_isImageLoaded[index]) {
                return Center(
                  child: Image.network(
                    widget.mangaPages.elementAt(index).src,
                    headers: widget.mangaPages.elementAt(index).headers,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes!)
                              : null,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                );
              }
            },
          ));
    }
  }
}
