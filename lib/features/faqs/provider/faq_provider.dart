import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../setting&preferences/domain/models/faqs_model.dart';
import '../../setting&preferences/domain/repository/setting_repository.dart';

final faqProvider = FutureProvider<FaqModel>((ref) async {
  final api = ref.read(settingRepository);
  return await api.getFaqs();
});
