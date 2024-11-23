import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Sıfırla"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "E-posta adresinizi girin. Şifre sıfırlama bağlantısı e-posta adresinize gönderilecektir.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-posta",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "E-posta adresini giriniz.";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Geçerli bir e-posta adresi giriniz.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Başarılı!"),
                        content: Text(
                          "E-posta adresinize şifre sıfırlama bağlantısı gönderildi.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Tamam"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text("Şifre Sıfırla"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
