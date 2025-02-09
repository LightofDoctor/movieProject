import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Войти в свою учётную запись',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          _HederWidget(),
        ],
      ),
    );
  }
}

class _HederWidget extends StatelessWidget {
  const _HederWidget();

  @override
  Widget build(BuildContext context) {
    final colorForButton = Color(0xFF01B4E4);
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(colorForButton)),
              child: Text('Register')),
          SizedBox(
            height: 5,
          ),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения,нажмите здесь, чтобы отправить письмо повторно. ',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(colorForButton)),
              child: Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.pushReplacementNamed(context, '/main_screen');
    } else {
      errorText = 'Неверный пароль или логин';
      print('error');
    }

    setState(() {});
  }

  void _resetPassword() {
    print('reset pas');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    final textStyle =
        const TextStyle(fontSize: 16, color: Color.fromARGB(255, 39, 42, 51));
    final colorForButton = Color(0xFF01B4E4);
    final textFieldDeocration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      isCollapsed: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
          SizedBox(
            height: 15,
          ),
        ],
        Text(
          'User name',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDeocration,
        ),
        SizedBox(height: 20),
        Text(
          'Password',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDeocration,
          obscureText: true,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  _auth();
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      colorForButton,
                    ),
                    textStyle: WidgetStateProperty.all(
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
                child: Text('Login')),
            SizedBox(
              width: 15,
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(colorForButton)),
                child: Text('Reset Password'))
          ],
        )
      ],
    );
  }
}
