import 'package:dio/dio.dart';

import '../../data/api/apply_pitch_api.dart';
import '../../data/dto/pitch_dto.dart';
import '../models/pitch_response.dart';
import 'pitch_apply_repository.dart';

class PitchApplyApiRepository implements PitchApplyRepository {
  PitchApplyApiRepository(this.client);

  final Dio client;

  @override
  Future<PitchResponseModel> pitchRequest(PitchDto pitchRequest) async {
    return await ApplyPitchApi(client).pitchRequest(pitchRequest);
  }
}
