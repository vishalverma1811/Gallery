import 'package:flutter/material.dart';
import 'package:gallery/features/home/data/model/image_model.dart';

class ImageInFull extends StatefulWidget {
  final Hits hit;
  final String imageUrl;

  const ImageInFull({Key? key, required this.imageUrl, required this.hit}) : super(key: key);

  @override
  _ImageInFullState createState() => _ImageInFullState();
}

class _ImageInFullState extends State<ImageInFull> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          _isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Center(
                child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
              ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Heart.png'),
                const SizedBox(width: 8),
                Text(
                  '${widget.hit.likes}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 16),
                Image.asset('assets/eye.png'),
                const SizedBox(width: 8),
                Text(
                  '${widget.hit.views}',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
