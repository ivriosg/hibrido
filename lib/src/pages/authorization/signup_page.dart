import 'package:flutter/material.dart';
import 'package:hibrido/src/api_service.dart';
import 'package:hibrido/src/models/customer.dart';
import 'package:hibrido/src/utils/ProgressHUD.dart';
import 'package:hibrido/src/utils/form_helper.dart';
import 'package:hibrido/src/utils/validator_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late APIService apiService;
  late Customer model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePasswprd = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = new APIService();
    model = new Customer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Híbrido',
          style: TextStyle(
            fontFamily: 'Cocogoose',
            fontSize: 30.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF000000),
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000000),
              Color(0xFF26437B),
              Color(0xFF183060),
            ],
          ),
        ),
        child: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _formUI(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel('Nombre'),
                FormHelper.textInput(
                  context,
                  model.firstName.toString(),
                  (value) => {
                    this.model.firstName = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return 'Ingresa el nombre.';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel('Apellido'),
                FormHelper.textInput(
                  context,
                  model.lastName.toString(),
                  (value) => {
                    this.model.lastName = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return 'Ingresa el apellido.';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel('Email'),
                FormHelper.textInput(
                  context,
                  model.email.toString(),
                  (value) => {
                    this.model.email = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return 'Ingresa un email';
                    }
                    if (value.isNotEmpty && !value.toString().isValidEmail()) {
                      return 'Ingresa un email valido.';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel('Password'),
                FormHelper.textInput(
                  context,
                  model.password.toString(),
                  (value) => {
                    this.model.password = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return 'Ingresa un password.';
                    }
                    return null;
                  },
                  obscureText: hidePasswprd,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePasswprd = !hidePasswprd;
                      });
                    },
                    icon: Icon(
                      hidePasswprd ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: FormHelper.saveButton(
                    'Registrarse',
                    () {
                      if (validateAndSave()) {
                        print(model.toJson());
                        setState(() {
                          isApiCallProcess = true;
                        });

                        apiService.createCustomer(model).then(
                          (ret) {
                            setState(() {
                              isApiCallProcess = false;
                            });

                            if (ret) {
                              FormHelper.showMessage(
                                context,
                                'Híbrido',
                                'Registro Exitoso',
                                'OK',
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            } else {
                              FormHelper.showMessage(
                                context,
                                'Híbrido',
                                'El email ya esta en uso',
                                'OK',
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
