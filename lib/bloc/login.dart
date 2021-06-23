import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q/bloc/login_state.dart';
import 'package:q/bloc/login_event.dart';

import 'login_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: close_sinks
  LoginBloc _loginBloc;
  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Pattern'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: BlocBuilder<LoginBloc, LoginState>(
            cubit: _loginBloc,
            builder: (context, state) {
              if (state.isGoToNextPage == true) {
                return buildLoading1(
                    onPress: () => _loginBloc.add(GoToBackPageEvent()));
              } else if (state.isGoToSecondPage == true) {
                return buildLoading2(
                    onPress: () => _loginBloc.add(GoToBackPageEvent()));
              } else if (state.isGoToThirdPage == true) {
                return buildLoading(
                    onPress: () => _loginBloc.add(GoToBackPageEvent()));
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(state.email ?? ''),
                    EmailInput(loginBloc: _loginBloc),
                    SizedBox(height: 20.0),
                    PasswordInput(loginBloc: _loginBloc),
                    SizedBox(height: 20.0),
                    Text(state.password ?? ''),
                    RaisedButton(
                      color: Colors.teal,
                      onPressed: () => {_loginBloc.add(GoToThirdPageEvent())},
                      child: Text("Submit"),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final LoginBloc loginBloc;
  const EmailInput({this.loginBloc});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => loginBloc.add(GoToNextPageEvent()),
      onChanged: (value) {
        loginBloc.add(OnEmailChangeEvent(email: value));
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter email',
        labelText: 'Email',
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final LoginBloc loginBloc;
  const PasswordInput({this.loginBloc});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => loginBloc.add(GoToSecondPageEvent()),
      onChanged: (value) {
        loginBloc.add(OnPasswordChangeEvent(password: value));
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter password',
        labelText: 'Password',
      ),
    );
  }
}

Widget buildLoading({Function onPress}) {
  return Center(
    child: Column(
      children: <Widget>[
        CircularProgressIndicator(),
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onPress,
        ),
      ],
    ),
  );
}

// class BuildLoading2 extends StatelessWidget {
//   final LoginBloc loginBloc;
//   const BuildLoading2({this.loginBloc});
//
//   @override
//   Widget build(BuildContext context) {
//     return buildLoading1();
//   }
// }

Widget buildLoading1({Function onPress}) {
  return Center(
    child: Column(
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          height: 40.0,
        ),
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onPress,
        ),
      ],
    ),
  );
}
//
// class Login {
//   final String emailInput;
//   final String passwordInput;
//
//   Login({
//     @required this.emailInput,
//     @required this.passwordInput,
//   });
// }

Widget buildLoading2({Function onPress}) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            PasswordInput(),
            SizedBox(
              height: 30,
            ),
            EmailInput(),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onPress,
            ),
          ],
        ),
      ),
    ),
  );
}
