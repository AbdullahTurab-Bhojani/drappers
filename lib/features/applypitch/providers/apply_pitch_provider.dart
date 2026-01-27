import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../drappers.dart';
import '../data/dto/pitch_dto.dart';
import '../domain/models/pitch_response.dart';
import '../domain/repository/pitch_apply_repository.dart';
part 'apply_pitch_provider.g.dart';

@Riverpod()
class PitchProvider extends _$PitchProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<PitchResponseModel> onSubmit({required PitchDto dto}) async {
    state = const AppLoadingState.loading();

    try {
      final api = ref.read(pitchApplyRepository);

      final response = await api.pitchRequest(dto);

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
