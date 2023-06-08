import 'package:test_app/core/network/api_constant.dart';
import 'package:test_app/core/network/dio_client.dart';
import 'package:test_app/screens/rockets_list/model/rocket_model.dart';

class RocketsListService {
  final DioClient dio;
  const RocketsListService({required this.dio});

  Future<List<RocketModel>> getRocketsList() async {
    print('ccccccccc');
    var response = await dio.get(
      APIConstants.GET_ROCKETS,
    );

    print(response);

    List<RocketModel> output = [];
    for (var item in response) {
      output.add(RocketModel.fromJson(item));
    }
    // print("ooooo" + output.toString());
    return output;
  }

  // Future<List<RocketModel>> getRocketById({required int rocketId}) async {
  //   try {
  //     var response = await dio.get(
  //       APIConstants.GET_ROCKETS_BY_ID,
  //       queryParameters: {
  //         "id": rocketId,
  //       },
  //       options: Options(extra: {"auth": true}),
  //     );
  //
  //     List<RocketModel> output = [];
  //     for (var item in response['results']) {
  //       output.add(RocketModel.fromJson(item));
  //     }
  //
  //     return output;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
