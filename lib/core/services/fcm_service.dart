part of '../../drappers.dart';

// @riverpod
// class FCMService extends _$FCMService {
//   @override
//   Future<String> build() async {
//     return await FirebaseMessaging.instance.getToken() ?? "";
//   }

//   Future<String> getFcm() async {
//     return await FirebaseMessaging.instance.getToken() ?? "";
//   }

//   onLogout() async {
//     await ref
//         .read(updateProfileProvider.notifier)
//         .onUpdateProfile(isPushNotification: true, fcmToken: "");
//   }

//   Future<void> setFcm({required bool isPushEnabled}) async {
//     if (isPushEnabled) {
//       state = AsyncValue.data(
//         await FirebaseMessaging.instance.getToken() ?? "",
//       );

//       await ref
//           .read(updateProfileProvider.notifier)
//           .onUpdateProfile(
//             isPushNotification: true,
//             fcmToken: state.valueOrNull,
//           );
//     } else {
//       await ref
//           .read(updateProfileProvider.notifier)
//           .onUpdateProfile(isPushNotification: false, fcmToken: "");
//     }
//     String userId = ref.read(localDataProvider).getUserId;
//     await ref.refresh(getUserProvider(userId).future);
//   }
// }
