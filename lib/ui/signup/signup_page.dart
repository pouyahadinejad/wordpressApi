import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantapp/api/api_service.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/models/woocommercr/register_model.dart';
import 'package:plantapp/ui/login/login_page.dart';
import 'package:plantapp/ui/signup/custom_form_field.dart';
import 'package:plantapp/ui/utils/custom_dialog_box.dart';
import 'package:plantapp/ui/utils/customer_appbar.dart';
import 'package:plantapp/ui/utils/extensions.dart';

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
          const BuildCustomAppBar(
            appBarTitle: "ثبت نام",
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
                        CustomerFormField(
                          labelName: 'نام',
                          textDirection: TextDirection.rtl,
                          initialValue: customerModel.firstName,
                          onChanged: (value) {
                            customerModel.firstName = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'این فیلد باید تکمیل شود';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30.0),
                        CustomerFormField(
                          labelName: 'نام خانوادگی',
                          textDirection: TextDirection.rtl,
                          initialValue: customerModel.lastName,
                          onChanged: (value) {
                            customerModel.lastName = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'این فیلد باید تکمیل شود';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30.0),
                        CustomerFormField(
                          labelName: 'ایمیل',
                          textDirection: TextDirection.ltr,
                          initialValue: customerModel.email,
                          onChanged: (value) {
                            customerModel.email = value;
                          },
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
                        const SizedBox(height: 30.0),
                        CustomerFormField(
                          labelName: 'پسورد',
                          textDirection: TextDirection.ltr,
                          initialValue: customerModel.password,
                          onChanged: (value) {
                            customerModel.password = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'این فیلد باید تکمیل شود';
                            }
                            if (!value!.isValidPassword) {
                              return "پسورد قوی نم باشد";
                            }
                            return null;
                          },
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
                                        CustomDialogBox.showMessage(
                                          context,
                                          "ثبت نام موفق",
                                          "ثبت نام شما با موفقیت انجام شد",
                                          "بستن",
                                          () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      } else {
                                        CustomDialogBox.showMessage(
                                          context,
                                          "ثبت نام ناموفق",
                                          "ایمیلی که استفاده کردید تکراری است",
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const LoginPage(),
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
