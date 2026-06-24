// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit_state.dart';
import 'package:vocap_notes/view/widgets/colors_widget.dart';
import 'package:vocap_notes/view/widgets/custom_container_eng_arab.dart';
import 'package:vocap_notes/view/widgets/custom_form.dart';
import 'package:vocap_notes/view/widgets/done_button.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteDataCubit, WriteDataCubitState>(
      builder: (context, state) {
        return Dialog(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            color: Color(context.read<WriteDataCubit>().colorCode),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomContainerEngArab(
                        text: "ar",
                        color: context.read<WriteDataCubit>().colorCode,
                        isArabic: true,
                      ),
                      SizedBox(width: 10),
                      CustomContainerEngArab(
                        text: "en",
                        color: context.read<WriteDataCubit>().colorCode,
                        isArabic: false,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ColorsWidget(
                    isActiveColor: context.read<WriteDataCubit>().colorCode,
                  ),
                  SizedBox(height: 10),
                  CustomForm(label: 'New Word'),
                  SizedBox(height: 20),
                  DoneButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
