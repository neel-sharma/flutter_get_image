import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class GetCachedNetworkImageWidget extends StatefulWidget {
  final String imageUrl;
  final BoxFit? boxFit;
  final Widget? errorWidget;
  final Widget? loaderWidget;

  const GetCachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.boxFit,
    this.errorWidget,
    this.loaderWidget,
  }) : super(key: key);

  @override
  _GetCachedNetworkImageWidgetState createState() =>
      _GetCachedNetworkImageWidgetState();
}

class _GetCachedNetworkImageWidgetState
    extends State<GetCachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: widget.boxFit ?? BoxFit.fill,
      errorWidget: (context, url, error) {
        debugPrint('GET IMAGE ERROR\nInvalid URL');
        return widget.errorWidget != null
            ? widget.errorWidget!
            : Container();
      },
      placeholder: (context, url) {
        return widget.loaderWidget != null
            ? widget.loaderWidget!
            : Container();
      },
    );
  }
}
