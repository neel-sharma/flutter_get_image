import 'package:flutter/material.dart';

import 'get_asset_image_widget.dart';
import 'get_cached_network_image_widget.dart';
import 'get_file_image_widget.dart';

class GetImage extends StatefulWidget {
  final String image;
  final bool isCircular;
  final double borderRadius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? loaderWidget;
  final bool isUrl;
  final bool isFile;

  const GetImage({
    Key? key,
    required this.image,
    this.isCircular = false,
    this.borderRadius = 0,
    this.height,
    this.width,
    this.fit,
    this.errorWidget,
    this.loaderWidget,
    this.isUrl = false,
    this.isFile = false,
  }) : super(key: key);

  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.isCircular
          ? BorderRadius.circular(100.0)
          : BorderRadius.circular(widget.borderRadius),
      child: Container(
        height: widget.height,
        width: widget.width,
        child: _getSelectedImage(),
      ),
    );
  }

  Widget _getSelectedImage() {
    if (widget.isUrl && widget.isFile) {
      debugPrint('GET IMAGE ERROR\nInvalid Type Selection');
      return Container();
    }
    if (widget.image.isEmpty) {
      debugPrint('GET IMAGE ERROR\nNo Image Provided');
      return Container();
    } else if (widget.isUrl) {
      return GetCachedNetworkImageWidget(
        imageUrl: widget.image,
        boxFit: widget.fit,
        errorWidget: widget.errorWidget,
        loaderWidget: widget.loaderWidget,
      );
    } else if (widget.isFile) {
      return GetFileImageWidget(
        imagePath: widget.image,
        boxFit: widget.fit,
        errorWidget: widget.errorWidget,
        loaderWidget: widget.loaderWidget,
      );
    }
    return GetAssetImageWidget(
      assetPath: widget.image,
      boxFit: widget.fit,
      errorWidget: widget.errorWidget,
      loaderWidget: widget.loaderWidget,
    );
  }
}
