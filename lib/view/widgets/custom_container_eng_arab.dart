import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/view/style/app_color.dart';

class CustomContainerEngArab extends StatelessWidget {
  const CustomContainerEngArab({
    super.key,
    required this.text,
    required this.color,
    required this.isArabic,
  });
  final String text;
  final int color;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return context.read<WriteDataCubit>().updateIsArabic(isArabic);
      },
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColor.white),
          shape: BoxShape.circle,
          color: isArabic == context.read<WriteDataCubit>().isArabic
              ? AppColor.white
              : Color(context.read<WriteDataCubit>().colorCode),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: !isArabic == context.read<WriteDataCubit>().isArabic
                ? AppColor.white
                : Color(context.read<WriteDataCubit>().colorCode),
          ),
        ),
      ),
    );
  }
}
