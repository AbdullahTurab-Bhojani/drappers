import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'startup_provider.dart';

final startupVoteProvider = FutureProvider.family<void, int>((
  ref,
  startupId,
) async {
  final repo = ref.read(startupRepositoryProvider);
  await repo.voteStartup(startupId);

  ref.invalidate(startupListProvider(''));
});
