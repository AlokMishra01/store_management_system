import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:store_management_system/widgets/app_buttons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scrollbar(
      radius: 8.circularRadius,
      child: SingleChildScrollView(
        child: Column(
          children: [
            16.gap,
            CircleAvatar(radius: 64.r),
            16.gap,
            Text(
              'Alok Mishra',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'alokmishra@gmail.com',
              style: TextStyle(
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '+977-9869050723',
              style: TextStyle(
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.gap,
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.sp,
                  color: theme.colorScheme.error,
                ),
                shape: RoundedRectangleBorder(borderRadius: 8.circular),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedLogout03,
                    color: theme.colorScheme.error,
                    size: 18.sp,
                  ),
                  4.gap,
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
            16.gap,
            Container(
              padding: 8.all,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 8.circular,
                border: Border.all(
                  color: theme.colorScheme.onPrimary.withOpacity(0.6),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: 8.circular,
                    child: AspectRatio(
                      aspectRatio: 3,
                      child: Image.network(
                        'https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  16.gap,
                  Text(
                    'Shop Name:',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Alok\'s Mishra',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.gap,
                  Divider(thickness: 2.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shop Address:',
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(0.6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Sankhamul, Kathamandu',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(HugeIcons.strokeRoundedLocationStar01),
                        padding: 0.all,
                      ),
                    ],
                  ),
                  Divider(thickness: 2.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shop Phone:',
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(0.6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+977 9869050723',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(HugeIcons.strokeRoundedCallOutgoing04),
                        padding: 0.all,
                      ),
                    ],
                  ),
                  Divider(thickness: 2.sp),
                  4.gap,
                  Text(
                    'Description:',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.gap,
                  Divider(thickness: 2.sp),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: AppButtons.filled(
                          icon: HugeIcons.strokeRoundedDelete02,
                          surfaceColor: theme.colorScheme.error,
                          onSurfaceColor: theme.colorScheme.onSurface,
                          label: 'Delete',
                          onPressed: () {},
                        ),
                      ),
                      8.gap,
                      Flexible(
                        flex: 1,
                        child: AppButtons.filled(
                          icon: HugeIcons.strokeRoundedEdit01,
                          surfaceColor: theme.colorScheme.primary,
                          onSurfaceColor: theme.colorScheme.onSurface,
                          label: 'Edit',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  4.gap,
                ],
              ),
            ),
            96.gap,
          ],
        ).pad(16.sp),
      ),
    );
  }
}
