import 'dart:io';
import 'package:flutter/material.dart';


class GetFileImageWidget extends StatefulWidget {
  final String imagePath;
  final BoxFit? boxFit;
  final Widget? errorWidget;
  final Widget? loaderWidget;

  const GetFileImageWidget({
    Key? key,
    required this.imagePath,
    this.boxFit,
    this.errorWidget,
    this.loaderWidget,
  }) : super(key: key);

  @override
  _GetFileImageWidgetState createState() => _GetFileImageWidgetState();
}

class _GetFileImageWidgetState extends State<GetFileImageWidget> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return _isValid
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File(widget.imagePath),
                ),
                onError: (exception, stackTrace) {
                  debugPrint('GET IMAGE ERROR\nInvalid File Path');
                  setState(() {
                    _isValid = false;
                  });
                },
                fit: widget.boxFit ?? BoxFit.fill,
              ),
            ),
          )
        : Container();
  }
}
