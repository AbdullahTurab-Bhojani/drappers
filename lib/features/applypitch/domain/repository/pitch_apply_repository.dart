import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../../data/dto/pitch_dto.dart';
import '../models/pitch_response.dart';
import 'pitch_apply_api_repository.dart';

abstract interface class PitchApplyRepository {
  Future<PitchResponseModel> pitchRequest(PitchDto pitchRequest);
}

final pitchApplyRepository = Provider<PitchApplyRepository>(
  (ref) => PitchApplyApiRepository(ref.read(client(AppConfig.baseUrl))),
);
