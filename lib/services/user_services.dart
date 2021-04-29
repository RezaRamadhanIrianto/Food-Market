part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password, {http.Client client}) async {
    
    if(client == null){
      client = http.Client();
    }
    String url = baseURL + 'login';

    var response = await client.post(url,
      headers: {"Content-type" : 'application/json'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password' : password
      })
    );
    if(response.statusCode != 200){
      return ApiReturnValue(message: "Wrong Username or Password");
    }
    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
    
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + "register";

    var response = await client.post(url,
        headers: {"Accept": "application/json"},
        body: {
          'name': user.name,
          'email': user.email,
          'password': password,
          "password_confirmation": password,
          "address": user.address,
          "city": user.city,
          "houseNumber": user.houseNumber,
          'phoneNumber': user.phoneNumber
        });

    if (response.statusCode != 200) {
      var data = jsonDecode(response.body);

      return ApiReturnValue(message: data["message"]);
    }
    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                "http://foodmarket-backend.buildwithangga.id/storage/" +
                    result.value);
      }
    }
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(
      File profilePicture,
      {http.MultipartRequest request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', profilePicture.path);
    request.files.add(multiPartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data']['0'];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(value: "Failed Upload");
    }
  }
}
