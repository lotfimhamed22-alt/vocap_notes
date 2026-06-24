import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/view/style/app_color.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({super.key, required this.isActiveColor});
  final int isActiveColor;

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  List<int> colorList = [
    0xFF2196F3,
    0xFF4CAF50,
    0xFFFF9800,
    0xFFE91E63,
    0xFF9C27B0,
    0xFFF44336,
    0xFF01BCD4,
    0xFFF45336,
    0xFF00BCD4,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colorList.length,
        itemBuilder: (context, index) => getSelectColor(context, index),
        separatorBuilder: (context, index) => SizedBox(width: 8),
      ),
    );
  }

  GestureDetector getSelectColor(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        return context.read<WriteDataCubit>().updateColorCode(colorList[index]);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(colorList[index]),
          shape: BoxShape.circle,
          border: colorList[index] == widget.isActiveColor
              ? Border.all(width: 2, color: AppColor.white)
              : null,
        ),
        child: colorList[index] == widget.isActiveColor
            ? Icon(Icons.done, weight: 20, size: 35, color: AppColor.white)
            : null,
      ),
    );
  }
}
