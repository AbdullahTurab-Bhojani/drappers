import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../startupDetails/provider/startup_detail_provider.dart';
import 'startup_provider.dart';

final startupVoteProvider = FutureProvider.family<void, int>((
  ref,
  startupId,
) async {
  final repo = ref.read(startupRepositoryProvider);
  await repo.voteStartup(startupId);

  ref.invalidate(startupListProvider(''));
  ref.invalidate(startupDetailProvider(startupId));
});
