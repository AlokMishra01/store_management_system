import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:hugeicons/hugeicons.dart';

import '../providers/auth_provider.dart';
import '../providers/storage_repository_provider.dart';
import '../providers/store_details_provider.dart';
import '../widgets/app_buttons.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final authService = ref.read(authProvider);
    final asyncUser = ref.watch(supabaseUserProvider);
    final storeDetailsAsync = ref.watch(storeDetailsProvider);
    final storageRepository = ref.read(storageRepositoryProvider);

    final userData = asyncUser.maybeWhen(
      data: (user) => user,
      orElse: () => null,
    );
    return Scrollbar(
      radius: 8.circularRadius,
      child: SingleChildScrollView(
        child: Column(
          children: [
            16.gap,
            CircleAvatar(
              radius: 64.r,
              backgroundImage: CachedNetworkImageProvider(
                userData?.userMetadata?['avatar_url'],
              ),
            ),
            16.gap,
            Text(
              userData?.userMetadata?['full_name'] ?? 'Loading...',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userData?.email ?? 'Loading...',
              style: TextStyle(
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.gap,
            OutlinedButton(
              onPressed: () {
                authService.signOut();
              },
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
            storeDetailsAsync.maybeWhen(
              orElse: () => const CircularProgressIndicator(),
              data: (store) => Container(
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
                        aspectRatio: 16 / 9,
                        child: FutureBuilder(
                          future: storageRepository.getPublicUrl(
                            'store',
                            store!['store_cover'],
                          ),
                          builder: (context, snapshot) {
                            return CachedNetworkImage(
                              imageUrl: snapshot.data ?? '',
                              fit: BoxFit.cover,
                              cacheKey: store['store_cover'],
                              errorWidget: (_, __, ___) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          },
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
                      store['name'],
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
                                store['address'],
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
                          icon:
                              const Icon(HugeIcons.strokeRoundedLocationStar01),
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
                                store['phone'],
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
                          icon:
                              const Icon(HugeIcons.strokeRoundedCallOutgoing04),
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
                      store['description'],
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
            ),
            96.gap,
          ],
        ).pad(16.sp),
      ),
    );
  }
}
