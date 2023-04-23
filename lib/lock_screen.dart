import 'dart:async';

import 'package:admin/dashboard.dart';
import 'package:admin/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  TextEditingController? pinCodeController;
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var customTheme = CustomTheme();
    String theme = "dark";
    return Scaffold(
      backgroundColor: customTheme.theme[theme]!["secondaryBackground"],
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        title: Text(
          'Enter Pin Code Below',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Confirm your Code',
                    style: Theme.of(context).textTheme.headlineSmall,
                    // customTheme.theme[theme]!["headlineSmall"],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                    child: Text(
                      'Login using the secure code shared at the time of signup.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontFamily: 'Outfit',
                                color: customTheme.theme[theme]!["primary"],
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: customTheme.theme[theme]!["primary"],
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      hintCharacter: '-',
                      pinTheme: PinTheme(
                        fieldHeight: 60,
                        fieldWidth: 60,
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: customTheme.theme[theme]!["primary"],
                        inactiveColor:
                            customTheme.theme[theme]!["primaryBackground"],
                        selectedColor:
                            customTheme.theme[theme]!["secondaryText"],
                        activeFillColor: customTheme.theme[theme]!["primary"],
                        inactiveFillColor:
                            customTheme.theme[theme]!["primaryBackground"],
                        selectedFillColor:
                            customTheme.theme[theme]!["secondaryText"],
                      ),
                      errorAnimationController: errorController,
                      //   dialogConfig: DialogConfig(),
                      controller: pinCodeController,
                      onChanged: (_) => {},
                      onCompleted: (_) {
                        if (_ == "231022") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                          );
                        } else {
                          errorController?.add(ErrorAnimationType.shake);
                          pinCodeController?.clear();
                          // setState(() {
                          //   pinCodeController?.clear();
                          // });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
              child: Material(
                elevation: 2,
                child: Container(
                  width: 270,
                  height: 50,
                  decoration: BoxDecoration(
                    color: customTheme.theme[theme]!["primaryText"],
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  // iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextButton(
                    onPressed: () async {
                      if (pinCodeController?.text == "231022") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      } else {
                        errorController?.add(ErrorAnimationType.shake);
                        pinCodeController?.clear();
                        // setState(() {
                        // });
                      }
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontFamily: 'Outfit',
                            color:
                                customTheme.theme[theme]!["primaryBackground"],
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
