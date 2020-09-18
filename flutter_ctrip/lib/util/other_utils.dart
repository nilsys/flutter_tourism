import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class Utils {
  static KeyboardActionsConfig getKeyboardActionsConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: Colors.white,
      nextFocus: true,
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text('关闭'),
                      ),
                    );
                  },
                ],
              )),
    );
  }
}
