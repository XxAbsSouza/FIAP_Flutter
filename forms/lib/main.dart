import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Form Styling Demo')),
//         body: Center(
//           child: FormExample(),
//         ),
//       ),
//     );
//   }
// }

// class FormExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//         child: TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Digite o termo que deseja buscar',
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//         child: TextField(
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(),
//             labelText: 'Digite seu nome de usuário',
//           ),
//         ),
//       ),
//     ]);
//   }
// }

// ------------------------------------- //


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
 

  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  String email = '';
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>(); //manera de acessar o widget do form sem o controller pois com o form n é possivel usar o controller
  bool obscureText = true;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buildEmail(),
          const SizedBox(
            height: 24,
          ),
          buildPassword(),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            //validar o form
            //acessar o form e executar a validação
            onPressed: () {
              bool valid = formKey.currentState!.validate(); //valida todos os campos dentro desse form
              if (valid) {
              print('Email: ${emailController.text}');
              print('Password: ${passwordController.text}');
              }
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }

  Widget buildEmail() => TextFormField(
    validator: (value){
      if (value == null || value.isEmpty || !value.contains('@') || !value.endsWith('.com')) {
        return 'Campo vazio, digite um email válido';
      }
      return null;
    },
    controller: emailController,
        onChanged: (value) {
          email = value;
        },
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'E-mail',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.email),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              emailController.clear();
            },
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() =>  TextFormField(
    
    validator: (value){
      if (value == null || value.isEmpty || value.characters.length<6) {
        return 'Campo vazio, digite uma senha válida';
      }
      return null;
    },
    obscureText: obscureText,
    controller: passwordController,
        decoration:  InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off) ,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });

            },
          ),
        ),
      );
}