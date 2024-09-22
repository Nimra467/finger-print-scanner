import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth extends StatefulWidget {
  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    try {
      bool authenticated = await _localAuthentication.authenticate(
        localizedReason: "Scan your fingerprint to authenticate",
        options: const AuthenticationOptions(biometricOnly: true),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fingerprint Authentication")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isAuthenticated
                ? "Authenticated successfully!"
                : "Not authenticated"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text("Authenticate with Fingerprint"),
            ),
          ],
        ),
      ),
    );
  }
}
