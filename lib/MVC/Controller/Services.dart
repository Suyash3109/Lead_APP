import 'package:e_commerce/MVC/Models/Customer_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future getPosts() async {
    var headers = {
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiQ2xpZW50IE1vYmlsZSIsIm5hbWUiOiJDbGllbnQgTW9iaWxlICIsIkFQSV9USU1FIjoxNjYyMDM3NTg1fQ.Mitu-l1fcEXf9FyaXCBvXv3vSHfhA2sy6FFLzOAo0ws',
      'Cookie':
          'csrf_cookie_name=f0bdd55b5a516e033ebcf3c301722c03; sp_session=8r0mre20l68oou2uea4ie5ap4b6he161'
    };
    var client = http.Client();
    var uri = Uri.parse(
      'https://easel.inkcasa.com/crm/api/customers',
    );

    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var json = response.body;

      return customerModelFromJson(json);
    }
  }
}
