import 'package:flutter/widgets.dart';

extension Space on double {
  SizedBox vSpace() {
    return SizedBox(height: this);
  }

  SizedBox hSpace() {
    return SizedBox(width: this);
  }
}
