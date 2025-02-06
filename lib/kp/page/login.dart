import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/kp/page/welcome.dart';
import 'package:flutter_app/kp/widget/animated_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const LoginApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text("Login"),
        // ),
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // 起始颜色
          begin: Alignment.topCenter,
          // 结束颜色
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFDEAE9),
            Colors.white,
          ],
        ),
      ),
      child: const Center(
        child: SizedBox(
          width: 320,
          child: LoginForm(),
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  double _formProgress = 0;
  bool showProgress = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 11,
              controller: _phoneTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Phone Number',
                  suffixIcon: Icon(Icons.clear),
                  hintText: 'Input 11-digit phone number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 6,
              obscureText: true,
              controller: _passwordTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.clear),
                  hintText: 'Input 6-digit password'),
            ),
          ),
          GestureDetector(
            onTap: _formProgress == 1 ? _showWelcomeScreen : null,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedProgressIndicator(
                  value: _formProgress,
                  // animationCompleted: () {
                  //   showProgress = false;
                  // },
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color:
                          _formProgress == 1 ? Colors.white : Colors.grey[400],
                      fontWeight: FontWeight.w800),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: TextButton(
                //         style: ButtonStyle(
                //           foregroundColor:
                //               WidgetStateProperty.resolveWith((states) {
                //             return states.contains(WidgetState.disabled)
                //                 ? Colors.grey[400]
                //                 : Colors.white;
                //           }),
                //           backgroundColor:
                //               WidgetStateProperty.resolveWith((states) {
                //             return states.contains(WidgetState.disabled)
                //                 ? Colors.grey[350]
                //                 : Colors.blue;
                //           }),
                //         ),
                //         onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
                //         child: const Text('Sign up'),
                //       ),
                //     )
                //   ],
                // ),
                // if (_formProgress != 1 && showProgress)
                //   AnimatedProgressIndicator(
                //     value: _formProgress,
                //     animationCompleted: () {
                //       showProgress = false;
                //     },
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [_phoneTextController, _passwordTextController];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      showProgress = _phoneTextController.value.text.isEmpty |
          _passwordTextController.value.text.isEmpty;
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }
}
