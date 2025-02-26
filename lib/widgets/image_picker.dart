import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class ImagePicker extends StatefulWidget {
  final List<OImage> images;
  final String sourceId;
  final Function(Set<int>) onChange;

  const ImagePicker({
    super.key,
    required this.images,
    required this.sourceId,
    required this.onChange,
  });

  @override
  createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  final Set<int> _selectedImages = {};

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Images',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = _selectedImages.contains(index);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedImages.remove(index);
                          } else {
                            _selectedImages.add(index);
                          }
                        });
                      },
                      child: Transform.scale(
                        scale: isSelected ? 0.9 : 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  isSelected ? Colors.blue : Colors.transparent,
                              width: isSelected ? 5.0 : 0.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Transform.scale(
                            scale: 0.9,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: OImage.network(
                                widget.images.elementAt(index).src,
                                sourceId: widget.sourceId,
                                headers: widget.images.elementAt(index).headers,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onChange(_selectedImages);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
