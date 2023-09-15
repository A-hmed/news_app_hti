import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
    return AlertDialog(
       content: Row(
         children: [
           Text("Loading..."),
           Spacer(),
           CircularProgressIndicator(),
         ],
       ),
    );
  });
}
void hideLoading(BuildContext context){
Navigator.pop(context);
}
void showErrorDialog(BuildContext context, String errorMessage){

  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: Text("Error"),
      content: Text(errorMessage),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Ok"))
      ],
    );
  });
}