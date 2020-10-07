import 'package:flutter/material.dart';


void main() async {
  print( getFirstName());
  print(await getSecondName());
  getFullName().then((String value) {
    print(value);
  });
}

Future<String> getFirstName() async {
  return "Muhammed";
}
Future<String> getSecondName() async {
  return "Essa";
}
Future<String> getFullName() async {
  return "Muhammed Essa Hameed";
}










//will wait there until async function finish

// void main() async {
//   await getFullName();
//   print('I was waiting to run :(');
// }
//
// Future getFullName() async {
//   print('We run first :) ');
//   return Future.delayed(Duration(seconds: 3), () {
//     print("Then I will run :) !");
//   });
// }












//without wait we using .Then

// void main() async {
//    getFullName().then((_) => {
//    print('3 - Muhammed Essa Hameed')
//    });
//   print('4 - I was waiting to run :(');
// }
//
// Future getFullName() async {
//   print('1 - We run first :) ');
//   return Future.delayed(Duration(seconds: 3), () {
//     print("2 - Then I will run :) !");
//   });
// }





// When to use async? When you want to define an async method.
// When to use await? When you need to wait there for the method to finish and then proceed with your code execution.
// When to use then? When you want to process Future after it was successfully finished in an async way - program will continue execution after this async method was called, but .then() callback will be executed later.
// When to use Future? When you want to get a result from an async function.