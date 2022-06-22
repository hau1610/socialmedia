import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialapp/widgets/LoadingIndicator/index.dart';

mixin LoadingOverlay {
  late final BuildContext context;

  final OverlayEntry _overlayEntry = OverlayEntry(
      builder: (ctx) => WillPopScope(
          child: Container(
            color: Colors.black45,
            child: const Center(
              child: LoadingIndicator(),
            ),
          ),
          onWillPop: () async {
            return false;
          }));

  Future<T> load<T>(Future<T> callback) async {
    FocusScope.of(context).requestFocus(FocusNode());
    Overlay.of(context)?.insert(_overlayEntry);
    final T data = await callback;
    if (_overlayEntry != null) {
      _overlayEntry.remove();
    }

    return data;
  }
}
