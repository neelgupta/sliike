import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Custom_Checkbox extends StatefulWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;

  Custom_Checkbox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => Custom_CheckboxState();
}

// ignore: camel_case_types
class Custom_CheckboxState extends State<Custom_Checkbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked);
        });
      },
      child: AnimatedContainer(
          height: widget.size ?? 20,
          width: widget.size ?? 20,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: isChecked
                  ? widget.backgroundColor ?? Colors.blue
                  : Colors.transparent,
              border: Border.all(color: widget.borderColor ?? Colors.black)),
          child: isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 20,
                )
              : null),
    );
  }
}

class CustomCheckboxListTile extends StatefulWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;
  String? titleText;
  String? subTitleText;

  CustomCheckboxListTile({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => Custom_CheckboxState();
}

// ignore: camel_case_types
class CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        children: [
          Checkbox(
            onChanged: (val) {
              setState(() {
                isChecked = !isChecked;
                widget.onChange(isChecked);
              });
            },
            value: isChecked,
          ),
        ],
      ),
      title: Text("${widget.titleText}"),
      subtitle: Text("${widget.subTitleText}"),
    );
    // GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       isChecked = !isChecked;
    //       widget.onChange(isChecked);
    //     });
    //   },
    //   child: AnimatedContainer(
    //     height: widget.size ?? 20,
    //     width: widget.size ?? 20,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.fastLinearToSlowEaseIn,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(4.0),
    //         color: isChecked
    //             ? widget.backgroundColor ?? Colors.blue
    //             : Colors.transparent,
    //         border: Border.all(color: widget.borderColor ?? Colors.black)),
    //     child: isChecked
    //         ? Icon(
    //             widget.icon ?? Icons.check,
    //             color: widget.iconColor ?? Colors.white,
    //             size: widget.iconSize ?? 20,
    //           )
    //         : null,
    //   ),
    // );
  }
}
