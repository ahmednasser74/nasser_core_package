import 'package:injectable/injectable.dart';

import '../nasser_core_package.dart';
import 'models.dart';

@Injectable()
class ExampleRepository {
  final Network network;

  ExampleRepository({required this.network});

  Future<AppResponseListResult<LoginResponseModel>> getData({required LoginRequestModel requestModel}) async {
    final response = await network.send<LoginResponseModel>(
      request: LoginRequest(requestModel),
      responseObject: LoginResponseModel(),
      responseType: ResponseType.list,
    );
    return response as AppResponseListResult<LoginResponseModel>;
  }
}
