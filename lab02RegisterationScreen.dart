import 'package:flutter/material.dart';

class RegisterationScreen extends StatefulWidget {
  RegisterationScreen({Key? key}) : super(key: key);

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final formKey = GlobalKey<FormState>();

  bool isSigningUp = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isSigningUp) {
      return Scaffold(
        body: SafeArea(
          child: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )),
        ),
      );
    } else {
      ScrollController scroller = ScrollController();

      return Scaffold(
        appBar: AppBar(
          title: Text(
            '19sw24',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Scrollbar(
            isAlwaysShown: true,
            controller: scroller,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                controller: scroller,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 'Register'.text.black.semiBold.size(26).makeCentered(),
                    Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter name.';
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'E-mail',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter an email.';
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              controller: passController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter password.';
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Address',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter name.';
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: MaterialButton(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () async {},
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Text(
                                    'name: noor, \nrollno: 19SW24, \ndepartment: software, \nbatch:19SW, \ndomicile: mirpurkhas')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
