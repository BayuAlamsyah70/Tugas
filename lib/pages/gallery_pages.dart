import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final String imageUrl;

  const GalleryPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Gambar")),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
