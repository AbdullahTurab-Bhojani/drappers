import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';

import '../models/faqs_model.dart';
import '../models/static_content.dart';
import 'setting_api_repository.dart';

abstract interface class SettingRepository {
  Future<StaticContent> getPolicies(String type);
  Future<FaqModel> getFaqs();
}

final settingRepository = Provider<SettingRepository>(
  (ref) => SettingApiRepository(ref.read(client(AppConfig.baseUrl))),
);
