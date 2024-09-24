import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';

class AppButtons {
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

  static Widget filled({
    required String label,
    required VoidCallback onPressed,
    Color? surfaceColor,
    Color? onSurfaceColor,
    bool isEnabled = true,
    bool isExpanded = true,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0.h,
        backgroundColor: surfaceColor,
        fixedSize: Size.fromHeight(52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 18.sp, color: onSurfaceColor),
          if (icon != null) 4.gap,
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: onSurfaceColor,
            ),
          ),
        ],
      ),
    );
  }
}
