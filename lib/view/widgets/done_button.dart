import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/view/style/app_color.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            "Done",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(context.read<WriteDataCubit>().colorCode),
            ),
          ),
        ),
      ],
    );
  }
}
