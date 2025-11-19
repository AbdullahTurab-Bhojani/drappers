part of '../../drappers.dart';

// final connectivityStreamProvider = StreamProvider<bool>((ref) {
//   return Connectivity().onConnectivityChanged.map((
//     List<ConnectivityResult> results,
//   ) {
//     return results.any(
//       (result) =>
//           result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.other ||
//           result == ConnectivityResult.wifi,
//     );
//   });
// });

// // Helper function to get current connectivity state
// Future<bool> getCurrentConnectivityState() async {
//   final results = await Connectivity().checkConnectivity();
//   return results.any(
//     (result) =>
//         result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.other ||
//         result == ConnectivityResult.wifi,
//   );
// }
