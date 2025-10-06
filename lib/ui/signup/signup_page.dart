import 'package:flutter/material.dart';
import 'package:plantapp/api/api_service.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/models/woocommercr/register_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late ApiService apiService;
  late CustomerModel customerModel;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool isApiCalled = false;
  @override
  void initState() {
    apiService = ApiService();
    customerModel = CustomerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constans.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Constans.primaryColor,
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constans.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.share,
                    color: Constans.primaryColor,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 150.0,
            left: 20.0,
            right: 20.0,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Form(
                key: globalKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.firstName,
                            onChanged: (value) {
                              customerModel.firstName = value;
                            },
                            cursorColor: Constans.primaryColor,
                            style: const TextStyle(
                              fontSize: 20.0,
                              height: 2.0,
                            ),
                            decoration: InputDecoration(
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              hintTextDirection: TextDirection.ltr,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constans.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 15.0,
                              ),
                              label: Text(
                                'نام',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Constans.primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.lastName,
                            onChanged: (value) {
                              customerModel.lastName = value;
                            },
                            cursorColor: Constans.primaryColor,
                            style: const TextStyle(
                              fontSize: 20.0,
                              height: 2.0,
                            ),
                            decoration: InputDecoration(
                              hintTextDirection: TextDirection.ltr,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constans.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 15.0,
                              ),
                              label: Text(
                                'نام خانوادگی',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Constans.primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.email,
                            onChanged: (value) {
                              customerModel.email = value;
                            },
                            cursorColor: Constans.primaryColor,
                            style: const TextStyle(
                              fontSize: 20.0,
                              height: 2.0,
                            ),
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              hintTextDirection: TextDirection.ltr,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constans.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 15.0,
                              ),
                              label: Text(
                                'ایمیل',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Constans.primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            obscureText: true,
                            initialValue: customerModel.password,
                            onChanged: (value) {
                              customerModel.password = value;
                            },
                            cursorColor: Constans.primaryColor,
                            style: const TextStyle(
                              fontSize: 20.0,
                              height: 2.0,
                            ),
                            decoration: InputDecoration(
                              hintTextDirection: TextDirection.ltr,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constans.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 15.0,
                              ),
                              label: Text(
                                'پسورد',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Constans.primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constans.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 10.0,
                                ),
                              ),
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  debugPrint('${customerModel.toJson()}');
                                  setState(() {
                                    isApiCalled = true;
                                  });
                                  apiService.createCustomer(customerModel).then(
                                    (retRes) {
                                      setState(() {
                                        isApiCalled = false;
                                      });
                                      if (retRes) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Woocomerce'),
                                              content: const Text(
                                                  'Registration SuccessFull'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('ok'),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Woocomerce'),
                                              content: const Text(
                                                  'Registration error'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('ok'),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'ثبت نام',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constans.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 10.0,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'قبلا اکانت ساختی؟',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        isApiCalled
                            ? const Text(
                                "لطفا منتظر بمانید ...",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            : const Text(""),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
