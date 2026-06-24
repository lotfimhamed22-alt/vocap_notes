import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/view/style/app_color.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.label});
  final String label;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController controllerWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        minLines: 1,
        maxLines: 2,
        controller: controllerWord,
        onChanged: (value) => context.read<WriteDataCubit>().updateText(value),
        validator: (value) {},
        cursorColor: AppColor.white,
        style: TextStyle(color: AppColor.white),
        decoration: _getInputDecoration(),
      ),
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      labelText: widget.label,
      labelStyle: TextStyle(color: AppColor.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.white),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.white),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.red),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.red),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
