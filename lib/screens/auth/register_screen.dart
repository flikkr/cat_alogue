
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String _name = '';
//   String _email = '';
//   String _password = '';
//   String _error = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: NavBar(title: 'Register your account'),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               Styles.y_space_20,
//               TextFormField(
//                 decoration:
//                     InputDecoration(hintText: 'Username'),
//                 validator: (name) => name.isEmpty ? 'Enter a name' : null,
//                 onChanged: (name) {
//                   setState(() => _name = name);
//                 },
//               ),
//               Styles.y_space_20,
//               TextFormField(
//                 decoration:
//                    InputDecoration(hintText: 'Email'),
//                 validator: (email) => Validator.validateEmail(email),
//                 onChanged: (email) {
//                   setState(() => _email = email);
//                 },
//               ),
//               Styles.y_space_20,
//               TextFormField(
//                 decoration: InputDecoration(hintText: 'Password'),
//                 obscureText: true,
//                 validator: (val) => val.length < 6
//                     ? 'Enter a password 6+ characters long'
//                     : null,
//                 onChanged: (val) {
//                   setState(() => _password = val);
//                 },
//               ),
//               SizedBox(
//                 height: 40,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
//                   child: Text(
//                     _error,
//                     style: TextStyle(color: Colors.red, fontSize: 12.0),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 child: Text('Register'),
//                 onPressed: () async {
//                   if (_formKey.currentState.validate()) {
//                     dynamic result = await AuthService.registerWithNameEmailAndPassword(
//                         _name, _email, _password);
//                     if (result == null) {
//                       setState(() =>
//                           _error = 'Please supply a valid email and password');
//                     } else {
//                       Navigator.pop(context);
//                     }
//                   } else {
//                     _error = '';
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
