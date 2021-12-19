import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetAssetImageWidget extends StatefulWidget {
  final String assetPath;
  final BoxFit? boxFit;
  final Widget? errorWidget;
  final Widget? loaderWidget;

  const GetAssetImageWidget({
    Key? key,
    required this.assetPath,
    this.boxFit,
    this.errorWidget,
    this.loaderWidget,
  }) : super(key: key);

  @override
  _GetAssetImageWidgetState createState() => _GetAssetImageWidgetState();
}

class _GetAssetImageWidgetState extends State<GetAssetImageWidget> {
  @override
  Widget build(BuildContext context) {
    return _isSvg()
        ? SvgPicture.asset(
            widget.assetPath,
            fit: widget.boxFit ?? BoxFit.none,
          )
        : Image.asset(
            widget.assetPath,
            fit: widget.boxFit ?? BoxFit.none,
          );
  }

  bool _isSvg() {
    return widget.assetPath.substring(
                widget.assetPath.length - 4, widget.assetPath.length) ==
            '.svg' ||
        widget.assetPath.substring(
                widget.assetPath.length - 4, widget.assetPath.length) ==
            '.SVG';
  }
}
