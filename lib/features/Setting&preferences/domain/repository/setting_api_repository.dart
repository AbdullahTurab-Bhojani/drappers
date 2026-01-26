import 'package:dio/dio.dart';
import '../../data/api/setting_api.dart';
import '../models/faqs_model.dart';
import '../models/static_content.dart';
import 'setting_repository.dart';

class SettingApiRepository implements SettingRepository {
  SettingApiRepository(this.client);

  final Dio client;

  @override
  Future<StaticContent> getPolicies(String type) async {
    return await SettingApi(client).getPolicies(type);
  }

  @override
  Future<FaqModel> getFaqs() async {
    return await SettingApi(client).getFaqs();
  }
}
