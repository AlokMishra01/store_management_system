import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:store_management_system/widgets/app_input_fields.dart';

import '../providers/store_form_provider.dart';
import '../widgets/app_buttons.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final storeFormState = ref.watch(storeFormProvider);
    final storeFormNotifier = ref.read(storeFormProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          16.gap,
          AppInputFields.textInput(
            label: 'Store Name',
            placeholder: 'Enter store name here...',
            prefix: HugeIcons.strokeRoundedStore01,
            onChanged: (value) => storeFormNotifier.updateName(value),
          ).padX(16.w),
          16.gap,
          AppInputFields.textInput(
            label: 'Store Address',
            placeholder: 'Enter store address here...',
            prefix: HugeIcons.strokeRoundedLocation08,
            onChanged: (value) => storeFormNotifier.updateAddress(value),
          ).padX(16.w),
          16.gap,
          AppInputFields.textInput(
            label: 'Store Phone Number',
            placeholder: 'Enter store phone number here...',
            prefix: HugeIcons.strokeRoundedCall02,
            onChanged: (value) => storeFormNotifier.updatePhone(value),
          ).padX(16.w),
          16.gap,
          AppInputFields.textArea(
            label: 'Store Description',
            placeholder: 'Enter store description here...',
            prefix: HugeIcons.strokeRoundedLicense,
            onChanged: (value) => storeFormNotifier.updateDescription(value),
          ).padX(16.w),
          16.gap,
          AppButtons.filled(
            label: 'Save store',
            isEnabled: storeFormState.isFormValid,
            onPressed: () async {
              await storeFormNotifier.saveStore();
              context.go('/home');
            },
          ).padX(16.w),
        ],
      ),
    );
  }
}
