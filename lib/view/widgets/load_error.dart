import 'dart:math';

import 'package:flutter/material.dart';

class LoadStateWidget extends StatefulWidget {
  const LoadStateWidget(this.hasError, {Key? key, this.onReload})
      : super(key: key);
  final VoidCallback? onReload;
  final bool hasError;

  @override
  State<LoadStateWidget> createState() => _LoadStateWidgetState();
}

class _LoadStateWidgetState extends State<LoadStateWidget> {
  late bool error;

  @override
  void initState() {
    error = widget.hasError;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return error
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('There was an error loading this data',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                ),
                if (widget.onReload != null)
                  TextButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: Text('Try Again'),
                    ),
                    onPressed: () {
                      widget.onReload?.call();
                    },
                  ),
              ],
            ),
          )
        : const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
