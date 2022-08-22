import "package:flutter/material.dart";
import "package:quickalert/quickalert.dart";

widget(BuildContext context) {
  final successAlert = buildButton(
    onTap: () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
        autoCloseDuration: const Duration(seconds: 2),
      );
    },
    title: 'Success',
    text: 'Transaction Completed Successfully!',
    leadingImage: Null,
  );
}

Card buildButton({
  required onTap,
  required title,
  required text,
  required leadingImage,
}) {
  return Card(
    shape: const StadiumBorder(),
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 1,
    child: ListTile(
      onTap: onTap,
      title: Text(title ?? ""),
      subtitle: Text(text ?? ""),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    ),
  );
}
