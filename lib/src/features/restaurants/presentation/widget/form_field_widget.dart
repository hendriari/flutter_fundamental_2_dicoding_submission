import 'package:flutter/material.dart';

Widget formFieldWidget({
  required BuildContext context,
  TextEditingController? controller,
  required String hintText,
  Function()? onTap,
  Function(String)? onChanged,
  bool? readOnly,
  Widget? prefix,
  Color? formColor,
  double? borderRadius,
  String? Function(String?)? validator,
  int? maxLines,
  Function()? onEditingComplete,
  TextInputAction? textInputAction,
}) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.grey,
    readOnly: readOnly ?? false,
    onTap: onTap,
    onChanged: onChanged,
    validator: validator,
    maxLines: maxLines,
    onEditingComplete: onEditingComplete,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: formColor ?? Colors.grey.withOpacity(.1),
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.grey.withOpacity(.7),
          ),
      prefixIcon: prefix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}
