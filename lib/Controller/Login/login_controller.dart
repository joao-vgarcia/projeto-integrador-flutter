import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_integrador/Model/local_keys.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LocalClientService localClient;
  
  LoginControllerBase(this.localClient);

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;
  
  @action
  updateUsername() {
    setUserLogged();
    localClient.setString(LocalKeys.userName, name);
  }
  
  @action
  bool isUserLogged() {
    return localClient.getBool(LocalKeys.login);
  }

  @action
  void setUserLogged() {
    localClient.setBool(LocalKeys.login, true);
  }
}