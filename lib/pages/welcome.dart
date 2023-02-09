import 'package:flutter/material.dart';
import 'package:todo_app/HomePage/home.dart';
import 'package:todo_app/login/loginPage.dart';
import 'package:todo_app/pages/signupPage.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('To Do App'),backgroundColor: Colors.pink[300],),
        body: Center(
    child: SingleChildScrollView(
    child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("“To-Do lists help us break life into small steps.”",style: TextStyle(fontSize: 25,color: Colors.black,fontStyle: FontStyle.italic)),
                const Text("Randy Pausch",style: TextStyle(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic)),
                Image.asset('assets/Images/welcome.png',width: 500, height: 150),
                Image.asset('assets/Images/download.png',width: 500, height: 250),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),backgroundColor: Colors.pink[400]),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return loginPage();
                      }));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Login', style: TextStyle(fontSize: 24,))
                        ]
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),backgroundColor: Colors.pink[400]),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return signupPage();
                      }));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sign up', style: TextStyle(fontSize: 24))
                        ]
                    ),
                  ),
                ),
              ]

          ),
        )
        )
    );
  }
}
