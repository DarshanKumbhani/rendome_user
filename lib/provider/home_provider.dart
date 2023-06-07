import 'package:flutter/cupertino.dart';

import '../api_helper/helper.dart';
import '../model/model_class.dart';

class UserProvider extends ChangeNotifier
{
  UserModel? data;

  Future<UserModel?> userDataModel()
  async {
    data = await Api_data.api_data.userDataParsing();
    notifyListeners();
  }
}
