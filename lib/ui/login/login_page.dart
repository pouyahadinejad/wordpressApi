import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantapp/api/api_service.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/models/woocommercr/register_model.dart';
import 'package:plantapp/ui/root/root_page.dart';
import 'package:plantapp/ui/signup/signup_page.dart';
import 'package:plantapp/ui/utils/custom_dialog_box.dart';
import 'package:plantapp/ui/utils/customer_appbar.dart';
import 'package:plantapp/ui/utils/extensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  late ApiService apiService;
  late CustomerModel customerModel;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController(text: 'sara@gmail.com');

  TextEditingController password =
      TextEditingController(text: 'q#QxqodJOAxOd)EmI^^5GOEv');

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
          const BuildCustomAppBar(
            appBarTitle: "ورد به برنامه",
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
                            controller: email,
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
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              hintTextDirection: TextDirection.rtl,
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
                                "ایمیل",
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
                              if (!value!.isValidEmail) {
                                return "ایمیل صحیح نمی باشد";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: password,
                            initialValue: customerModel.password,
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
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              hintTextDirection: TextDirection.rtl,
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
                                "پسورد",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Constans.primaryColor,
                                ),
                              ),
                            ),
                            // validator: (value) {
                            //   if (value.toString().isEmpty) {
                            //     return 'این فیلد باید تکمیل شود';
                            //   }
                            //   if (!value!.isValidEmail) {
                            //     return "ایمیل صحیح نمی باشد";
                            //   }
                            //   return null;
                            // },
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
                                  // debugPrint('${customerModel.toJson()}');
                                  setState(() {
                                    isApiCalled = true;
                                  });
                                  apiService
                                      .loginCustomer(
                                    email.text,
                                    password.text,
                                  )
                                      .then(
                                    (retRes) {
                                      // debugPrint(retRes.data!.token.toString());
                                      // debugPrint(
                                      //     retRes.data!.toJson().toString());
                                      setState(() {
                                        isApiCalled = false;
                                      });
                                      if (retRes.success!) {
                                        CustomDialogBox.showMessage(
                                          context,
                                          "موفقیت امیز",
                                          "ورود با موفقیت انجام شد",
                                          "بستن",
                                          () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                child: const RootPage(),
                                                type: PageTransitionType
                                                    .leftToRight,
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        CustomDialogBox.showMessage(
                                          context,
                                          "ناموفق",
                                          "نام کاربری یا ایمیل اشتباه است",
                                          "بستن",
                                          () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'ورود',
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const SignupPage(),
                                    type: PageTransitionType.leftToRight,
                                  ),
                                );
                              },
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
