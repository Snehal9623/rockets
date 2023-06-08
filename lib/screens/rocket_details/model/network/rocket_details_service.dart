import 'package:test_app/core/network/api_constant.dart';
import 'package:test_app/core/network/dio_client.dart';
import 'package:test_app/screens/rockets_list/model/view_details.dart';

class RocketsDetailsService {
  final DioClient dio;

  const RocketsDetailsService({required this.dio});

  Future<ViewModel> getRocketData({required String id}) async {
    try {
      var response = await dio.get(
        "${APIConstants.GET_ROCKETS_BY_ID}$id",
      );

      print(response);

//       List<ViewModel> output = [];
//       for (var item in response) {
//         output.add(ViewModel.fromJson(item));
//         print(output)
// ;      }
      return ViewModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
