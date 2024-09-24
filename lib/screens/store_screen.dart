import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_management_system/widgets/app_app_bar.dart';
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
      appBar: const AppAppBar(
        title: 'Add Store',
        subTitle: 'Please add your store',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.gap,
            AspectRatio(
              aspectRatio: 16 / 9,
              child: InkWell(
                onTap: () async {
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedImage != null) {
                    final croppedImage = await ImageCropper().cropImage(
                      sourcePath: pickedImage.path,
                      uiSettings: [
                        AndroidUiSettings(
                          toolbarTitle: 'Crop store banner',
                          toolbarWidgetColor: theme.appBarTheme.foregroundColor,
                          toolbarColor: theme.appBarTheme.backgroundColor,
                          backgroundColor: theme.appBarTheme.backgroundColor,
                          hideBottomControls: true,
                          initAspectRatio: CropAspectRatioPreset.ratio16x9,
                          lockAspectRatio: true,
                          aspectRatioPresets: [
                            CropAspectRatioPreset.ratio16x9,
                          ],
                        ),
                        IOSUiSettings(
                          title: 'Crop store banner',
                          aspectRatioPresets: [
                            CropAspectRatioPreset.ratio16x9,
                          ],
                        ),
                      ],
                    );

                    if (croppedImage != null) {
                      storeFormNotifier.updateStoreCover(croppedImage.path);
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.unselectedWidgetColor,
                    ),
                    borderRadius: 8.circular,
                  ),
                  child: storeFormNotifier.getStoreCover != null
                      ? ClipRRect(
                          borderRadius: 8.circular,
                          child: Image.file(
                            File(storeFormNotifier.getStoreCover!),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              HugeIcons.strokeRoundedImageAdd02,
                              color: theme.unselectedWidgetColor,
                              size: 36.sp,
                            ),
                            4.gap,
                            Text(
                              'Add store cover image',
                              style: TextStyle(
                                color: theme.unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ).padX(16.w),
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
      ),
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
