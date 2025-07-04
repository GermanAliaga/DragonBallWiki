import 'package:http/http.dart';

class ServiceApi {
  String urlRequest;

  ServiceApi(this.urlRequest);

  Future<String> getApi(String searchQuery) async {
    final url = Uri.parse('$urlRequest/characters/$searchQuery');

    final response = await get(url);

    if(response.statusCode == 200)
    {
      return response.body;
    }
    else 
    {
      throw Exception('Failed to load character');
    }
  }
}