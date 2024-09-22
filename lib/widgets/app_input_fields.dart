import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputFields {
  /// Function to handle input decoration for all types of input fields
  static InputDecoration _buildInputDecoration({
    required String label,
    required String placeholder,
    String? error,
    IconData? suffix,
    IconData? prefix,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: placeholder,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      errorText: error,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      prefixIconConstraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
      prefixIcon: prefix != null ? Icon(prefix) : null,
      suffixIcon: suffix != null ? Icon(suffix) : null,
    );
  }

  // Static method for Text Input
  static Widget textInput({
    required String label,
    required String placeholder,
    TextEditingController? controller,
    String? error,
    IconData? suffix,
    IconData? prefix,
    Function(String)? onChanged,
  }) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: _buildInputDecoration(
          label: label,
          placeholder: placeholder,
          error: error,
          prefix: prefix,
          suffix: suffix,
        ),
      ),
    );
  }

  // // Static method for Date Input
  // static Widget dateInput({
  //   required String label,
  //   required BuildContext context,
  //   required TextEditingController dateController,
  //   required ThemeData theme,
  // }) {
  //   return TextFormField(
  //     controller: dateController,
  //     readOnly: true,
  //     decoration: _buildInputDecoration(
  //       label: label,
  //       suffixIcon: Icons.calendar_today,
  //       theme: theme,
  //     ),
  //     onTap: () async {
  //       DateTime? pickedDate = await showDatePicker(
  //         context: context,
  //         initialDate: DateTime.now(),
  //         firstDate: DateTime(2000),
  //         lastDate: DateTime(2101),
  //       );
  //       if (pickedDate != null) {
  //         dateController.text = pickedDate.toString();
  //       }
  //     },
  //   );
  // }
  //
  // // Static method for Dropdown Input (Select)
  // static Widget selectInput({
  //   required String label,
  //   required List<DropdownMenuItem<String>> items,
  //   required ValueChanged<String?> onChanged,
  //   String? value,
  //   required ThemeData theme,
  // }) {
  //   return DropdownButtonFormField<String>(
  //     decoration: _buildInputDecoration(label: label, theme: theme),
  //     value: value,
  //     items: items,
  //     onChanged: onChanged,
  //   );
  // }
  //
  // Static method for Text Area
  static Widget textArea({
    required String label,
    required String placeholder,
    TextEditingController? controller,
    String? error,
    int maxLines = 5,
    IconData? suffix,
    IconData? prefix,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: _buildInputDecoration(
        label: label,
        placeholder: placeholder,
        error: error,
        prefix: prefix,
        suffix: suffix,
      ),
    );
  }
  //
  // // Static method for Phone Input
  // static Widget phoneInput({
  //   required String label,
  //   TextEditingController? controller,
  //   bool isError = false,
  //   required ThemeData theme,
  // }) {
  //   return TextFormField(
  //     controller: controller,
  //     keyboardType: TextInputType.phone,
  //     decoration: _buildInputDecoration(
  //       label: label,
  //       isError: isError,
  //       theme: theme,
  //     ),
  //   );
  // }
}
