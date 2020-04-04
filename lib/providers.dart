import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class providers extends ChangeNotifier{
  bool _heelo ;
  bool _smil ;

  bool get heelo => _heelo;
  bool get smil => _smil;

  providers(){
    _heelo = false;
    _smil = false;
    loadSharedPref();
  }
  void setheelo(bool value) {
    _heelo = value;
    notifyListeners();
    setSharedPref();
  }

  void setsmil(bool value) {
    _smil = value;
    notifyListeners();
    setSharedPref();
  }

  void setSharedPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('hell', _heelo);
    sharedPreferences.setBool('smile', _smil);
  }

  void loadSharedPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool Hello = sharedPreferences.getBool('hell');
    bool smil = sharedPreferences.getBool('smile');
    print("value from shared pref of heelo::${Hello}");
    print("value from shared pref of smile::${smil}");
    if(Hello!=null)setheelo(Hello);
    if(smil!=null)setheelo(smil);
  }

}