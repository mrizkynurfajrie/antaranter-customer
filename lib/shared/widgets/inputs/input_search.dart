import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';

class InputSearch extends StatefulWidget {
  const InputSearch(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.hintText = 'Cari',
      this.suffixIcon})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: TextStyles.body2,
      decoration: inputDecoration(
          hintText: widget.hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.med),
            child: Icon(
              Icons.search,
              size: IconSizes.med,
              color: AppColor.primaryColor,
            ),
          ),
          suffixIcon: widget.suffixIcon),
    );
  }
}
