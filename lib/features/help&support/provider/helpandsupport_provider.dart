import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../drappers.dart';
import '../../setting&preferences/data/dto/support_dto.dart';
import '../../setting&preferences/domain/models/support_model.dart';
import '../../setting&preferences/domain/repository/setting_repository.dart';

part 'helpandsupport_provider.g.dart';

@Riverpod()
class HelpAndSupportProvider extends _$HelpAndSupportProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<SupportResponse> onSubmit({required SupportRequestDto dto}) async {
    state = const AppLoadingState.loading();

    try {
      final api = ref.read(settingRepository);

      final response = await api.ticketRequest(dto);

      if (!response.isSuccess) {
        state = AppLoadingState.error(response.message);
        return response;
      }

      state = AppLoadingState.success(response);
      return response;
    } catch (e) {
      state = AppLoadingState.error(
        e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
}
