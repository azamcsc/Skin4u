import 'package:card_swiper/card_swiper.dart';
import 'package:customers_app/screens/auth/register.dart';
import 'package:customers_app/screens/home_screen%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../consts/contss.dart';
import '../../fetch_data.dart';
import '../home_screen.dart';
import '../loading_manager.dart';
import 'forget_pass.dart';
import '../../services/global_methods.dart';
import '../../widgets/google_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  bool _isLoading = false;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }


  initState() {
    _emailTextController.text="test@gmail.com";
    _passTextController.text="Tester1";
  }


// To Create method of Sign In with Email
  void _submitFormOnLogin() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text.trim());
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreenC(),
          ),
        );
        print('Succefully logged in');
        //       // To create errorDialog
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // To create a logged in screen UI
    return Scaffold(
      body:  LoadingManager(
        isLoading: _isLoading,
        child:
        Stack(children: [
        // To control with autoplay images background
        Swiper(
          duration: 800,
          autoplayDelay: 8000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              Constss.authImagesPaths[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: Constss.authImagesPaths.length,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "To Our Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        //Password

                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitFormOnLogin();
                          },
                          controller: _passTextController,
                          focusNode: _passFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),

                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            //focused border
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context,
                          routeName: ForgetPasswordScreen.routeName);
                    },
                    child: const Text(
                      'Forget password?',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white30, // background (button) color
                        ),
                        onPressed: () {
                          _submitFormOnLogin();
                        },
                        child: Text('Login In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white30, // background (button) color
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreenC(),
                            ),
                          );
                        },
                        child: Text('As Guest',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GoogleButton(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          children: [
                        TextSpan(
                            text: '  Sign up',
                            style: const TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GlobalMethods.navigateTo(
                                    ctx: context,
                                    routeName: RegisterScreen.routeName);
                              }),
                      ])),
                )
              ],
            ),
          ),
        )
      ]),
      ),
    );
  }
}
