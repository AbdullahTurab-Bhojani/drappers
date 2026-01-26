import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/static_content.dart';
import '../domain/repository/setting_repository.dart';

final staticContentProvider = FutureProvider.family<StaticContent, String>((
  ref,
  type,
) async {
  final api = ref.read(settingRepository);
  return await api.getPolicies(type);
});
