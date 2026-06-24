import 'package:flutter/material.dart';
import 'package:vocap_notes/view/style/app_color.dart';
import 'package:vocap_notes/view/widgets/show_dialog_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      floatingActionButton: _getFloatongActionButton(context),
    );
  }

  FloatingActionButton _getFloatongActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.white,

      onPressed: () {
        showDialog(
          context: context,

          builder: (context) {
            return ShowDialogWidget();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
