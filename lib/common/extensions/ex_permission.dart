// part of '../extensions.dart';

// extension MPermissionStore on IUserPermission {
//   /// Request photo permission for:
//   /// - Android 10–12 (storage)
//   /// - Android 13–16 (READ_MEDIA_*)
//   /// - Huawei EMUI / HarmonyOS (AppGallery)
//   ///
//   /// Flow: PhotoManager → permission_handler → open Settings if needed.
//   requestStoragePermission(
//     BuildContext context, {
//     Function? onHasPermission,
//     Function? onNoPermission,
//   }) async {
//     bool called = false;

//     Future<bool> ensurePhotoAccess() async {
//       // --- Step 1: PhotoManager (required on API 33+) ---
//       try {
//         final PermissionState ps = await PhotoManager.requestPermissionExtend(
//           requestOption: const PermissionRequestOption(
//             androidPermission: AndroidPermission(
//               // common = images + video → avoids denied bug when VIDEO is missing
//               type: RequestType.common,
//               mediaLocation: false,
//             ),
//           ),
//         );
//         if (ps.isAuth || ps.hasAccess) {
//           return true;
//         }
//       } catch (_) {
//         // Continue fallback
//       }

//       // --- Step 2: permission_handler (Huawei / older devices often need this) ---
//       try {
//         final List<Permission> perms = <Permission>[
//           if (Platform.isIOS) Permission.photos,
//           if (Platform.isAndroid) ...[
//             Permission.photos,
//             Permission.videos,
//             Permission.storage, // Old EMUI / Android <= 12
//           ],
//         ];

//         // Request one-by-one so Huawei dialogs stay stable
//         for (final p in perms) {
//           final status = await p.status;
//           if (!status.isGranted && !status.isLimited) {
//             await p.request();
//           }
//         }

//         final PermissionState ps2 =
//             await PhotoManager.requestPermissionExtend();
//         if (ps2.isAuth || ps2.hasAccess) {
//           return true;
//         }

//         // Some Huawei devices report limited/denied but can still read MediaStore
//         // → verify in practice via getAssetPathList
//         try {
//           final paths = await PhotoManager.getAssetPathList(
//             type: RequestType.image,
//             onlyAll: true,
//           );
//           if (paths.isNotEmpty) {
//             final count = await paths.first.assetCountAsync;
//             if (count > 0) return true;
//           }
//         } catch (_) {}
//       } catch (_) {}

//       return false;
//     }

//     final bool ok = await ensurePhotoAccess();
//     if (ok) {
//       if (onHasPermission != null) onHasPermission();
//       return;
//     }

//     // No permission → guide user to Settings (Huawei: Apps → Permissions → Storage/Photos)
//     WidgetUtils.instance.showRequestPermissionPopup(
//       title:
//           '${Configuration.instance.business.appName} ${S.of(context).wouldLikeToAccessYourPhotos}',
//       message:
//           '${S.of(context).allow} ${Configuration.instance.business.appName} ${S.of(context).toAccessPhotosOnYourDeviceToEditOrShare}',
//       onForeground: () async {
//         try {
//           await PhotoManager.openSetting();
//         } catch (_) {
//           await openAppSettings();
//         }
//         final bool ok2 = await ensurePhotoAccess();
//         if (ok2 && !called) {
//           called = true;
//           WidgetUtils.instance.dismiss();
//           if (onHasPermission != null) onHasPermission();
//         }
//       },
//     );

//     if (onNoPermission != null) onNoPermission();
//   }
// }
