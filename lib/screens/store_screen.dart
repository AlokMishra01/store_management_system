import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:store_management_system/widgets/app_input_fields.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Store'),
      ),
      body: Column(
        children: [
          20.gap,
          AppInputFields.textInput(
            label: 'Store Name',
            placeholder: 'Enter store name here...',
            prefix: HugeIcons.strokeRoundedStore01,
          ).padX(16.w),
        ],
      ),
    );
  }
}
