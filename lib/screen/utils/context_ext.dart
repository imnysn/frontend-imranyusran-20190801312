import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ScaffoldMessengerState get snackbar => ScaffoldMessenger.of(this);
  Size get mediaSize => MediaQuery.of(this).size;
}
