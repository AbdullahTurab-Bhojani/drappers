import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../voteforstartup/domain/models/startup_model.dart';
import '../../voteforstartup/provider/startup_provider.dart';

part 'startup_detail_provider.g.dart';

final startupDetailProvider = FutureProvider.family<StartupModel?, int>((
  ref,
  id,
) async {
  final repo = ref.read(startupRepositoryProvider);
  return repo.getStartupById(id);
});

@riverpod
Future<StartupModel?> getStartupDetail(Ref ref, int id) async {
  final repo = ref.read(startupRepositoryProvider);
  return repo.getStartupById(id);
}
