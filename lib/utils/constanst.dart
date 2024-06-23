import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import '../utils/app_str.dart';

// Empty Title & Subtitle TextField
emptyFieldsWarning(context) {
  return FToast.toast(
    context,
    msg: MyString.oopsMsg,
    subMsg: 'You must fill all Fields',
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

// Notthing Enter when user try to edit the current note
nothingEnterUpdateNote(context) {
  return FToast.toast(
    context,
    msg: MyString.oopsMsg,
    subMsg: 'You must edit the note then try to update it!',
    corner: 20.0,
    duration: 3000,
    padding: const EdgeInsets.all(20),
  );
}
