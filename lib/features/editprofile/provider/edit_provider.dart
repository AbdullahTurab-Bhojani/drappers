// ignore_for_file: unused_result

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/provider/user_provider.dart';
import '../../authentication/data/dto/user_update_dto/user_update.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/models/user_model.dart';
import '../../user/domain/repository/user_repository.dart';
import '../../../drappers.dart';
part 'edit_provider.g.dart';

@Riverpod()
class UpdateUserProvider extends _$UpdateUserProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<UserData?> onSubmit({required UpdateUserDTO dto}) async {
    state = const AppLoadingState.loading();

    try {
      final pref = ref.read(localDataProvider);
      final auth = ref.read(authRepository);
      final userRepo = ref.read(userRepository);

      final response = await auth.updateProfile(dto);

      if (response.isSuccess) {
        final userResponse = await userRepo.getUser();

        await pref.saveUser(userResponse.data!);
        await pref.saveUserId(userResponse.data!.id.toString());
        await pref.saveUserName(userResponse.data!.fullName ?? '');
        ref.invalidate(userDataProvider);
        ref.refresh(localDataProvider);

        state = AppLoadingState.success(userResponse);
        return userResponse.data;
      }

      state = AppLoadingState.error(response.message);
      return null;
    } catch (e) {
      state = AppLoadingState.error(
        e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
}
