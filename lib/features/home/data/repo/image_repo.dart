import 'package:gallery/core/network/networks_api_services.dart';

class ImageRepo{
  final api = NetworkApiServices();

  Future<dynamic> getImage() async {
    dynamic response = await api.getApi('https://pixabay.com/api/?key=43404716-bf8801eb7bc8133d3b0ac8183');
    return response;
  }
}