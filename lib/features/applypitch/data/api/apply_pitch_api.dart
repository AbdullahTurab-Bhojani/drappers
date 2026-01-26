import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/pitch_response.dart';
import '../dto/pitch_dto.dart';
part 'apply_pitch_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/')
abstract class ApplyPitchApi {
  factory ApplyPitchApi(Dio dio, {String baseUrl}) = _ApplyPitchApi;

  @POST('pitch-request')
  Future<PitchResponseModel> pitchRequest(@Body() PitchDto pitchrequest);
}
