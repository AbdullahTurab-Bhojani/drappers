import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../voteforstartup/domain/models/startup_model.dart';
import '../../voteforstartup/provider/startup_provider.dart';

final startupDetailProvider = FutureProvider.family<StartupModel?, int>((
  ref,
  id,
) async {
  final repo = ref.read(startupRepositoryProvider);
  return repo.getStartupById(id);
});
