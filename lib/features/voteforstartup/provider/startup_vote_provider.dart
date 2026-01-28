import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../startupDetails/provider/startup_detail_provider.dart';
import 'startup_provider.dart';

final startupVoteProvider = Provider.family<Future<void> Function(), int>((
  ref,
  startupId,
) {
  return () async {
    final repo = ref.read(startupRepositoryProvider);
    await repo.voteStartup(startupId);

    ref.refresh(startupListProvider(''));
    ref.refresh(getStartupDetailProvider(startupId));
  };
});
