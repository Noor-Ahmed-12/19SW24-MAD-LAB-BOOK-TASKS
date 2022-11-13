import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key, this.title='First Task'});

  final String title;

  @override
  State<FirstTask> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstTask> {


  TextEditingController nameCont =TextEditingController(text: ''); 
  TextEditingController rollCont =TextEditingController(text: ''); 

  List<String> keys=[];
  List<String> students=[];

  late SharedPreferences pref;


  initPref()async{
    pref = await SharedPreferences.getInstance();
    keys = pref.getKeys().toList();
    update();
  }

  @override
  void initState() { 
    super.initState();
    initPref();
  }


  update(){
    keys = pref.getKeys().toList();
    setState(() {
      students = keys.map((e) => pref.getString(e)!).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  labelText: 'Name'
                ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: rollCont,
                    decoration: const InputDecoration(
                      labelText: 'Email'
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    if(rollCont.text.isNotEmpty&&nameCont.text.isNotEmpty){
                      pref.setString(rollCont.text, nameCont.text);
                      rollCont.clear();
                      nameCont.clear();
                      update();
                    }
                  },
                  icon: const Icon(Icons.add)
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) 
                  => 
                  ListTile(
                    title: Text('Email: ${keys[index]}'),
                    subtitle: Text('Name: ${students[index]}'),
                    trailing: IconButton(
                      onPressed: (){
                        delete(keys[index]);
                      },
                      icon: const Icon(Icons.delete)
                    ),
                  ),
              ),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  void delete(String rollNo) {
    pref.remove(rollNo);
    update();
  }

}