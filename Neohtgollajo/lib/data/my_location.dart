import 'package:geolocator/geolocator.dart';


class MyLocation{
  double? latitude2;
  double? longitude2;
  
  //Future를 사용하여 await를 통해 답이 오는 것을 기다림
  Future<void> getMyCurrentLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
    }
    //인터넷이 불안정한 지역이거나 위치 정보 동의에 거부했을 때를 위해서 try catch문으로 구현함
    catch(e){
      print('There was a problem with the internet connection');
    }

  }

}

