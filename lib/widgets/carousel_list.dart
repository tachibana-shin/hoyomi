import 'package:flutter/material.dart';

class CarouselList extends StatefulWidget {
  const CarouselList({super.key});

  @override
  State<CarouselList> createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('CarouselList is working', style: TextStyle(fontSize: 20)),
    );
  }
}
