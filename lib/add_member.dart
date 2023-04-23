import 'package:admin/dashboard.dart';
import 'package:admin/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '/main.dart';

class AddMemberWidget extends StatefulWidget {
  const AddMemberWidget({Key? key}) : super(key: key);

  @override
  _AddMemberWidgetState createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  String theme = "dark", dob = "";
  String? selectedClass;
  var customTheme = CustomTheme();
  List<String> classList = [
    "LKG",
    "UKG",
    "First",
    "Second",
    "Third",
    "Fourth",
    "Fifth",
    "Sixth",
    "Eighth",
    "Ninth",
    "Tenth"
  ];
  List<bool> toggleList1 = [false, false], toggleList2 = [false];
  int selectedRadio = -1;
  bool isStaff = false;
  TextEditingController phoneNumberController1 = TextEditingController();
  TextEditingController phoneNumberController2 = TextEditingController();
  TextEditingController phoneNumberController3 = TextEditingController();
  TextEditingController phoneNumberController4 = TextEditingController();
  TextEditingController phoneNumberController5 = TextEditingController();
  TextEditingController phoneNumberController6 = TextEditingController();
  TextEditingController phoneNumberController7 = TextEditingController();
  TextEditingController phoneNumberController8 = TextEditingController();
  TextEditingController phoneNumberController9 = TextEditingController();
  TextEditingController phoneNumberController10 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customTheme.theme[theme]!["primaryBackgroundColor"],
      appBar: AppBar(
        backgroundColor: customTheme.theme[theme]!["primaryBackgroundColor"],
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: customTheme.theme[theme]!["grayLight"],
            size: 32,
          ),
        ),
        title: Text(
          isStaff ? 'Add Staff Profile' : 'Add Student Profile',
          style: GoogleFonts.outfit(fontStyle: FontStyle.normal, fontSize: 22),
        ),
        actions: [
          Switch(
              // inactiveThumbImage: ,
              value: isStaff,
              thumbColor: MaterialStatePropertyAll(
                  customTheme.theme[theme]!["secondaryColor"]),
              activeColor: customTheme.theme[theme]!["secondaryColor"],
              thumbIcon: !isStaff
                  ? MaterialStatePropertyAll(Icon(
                      Icons.person,
                      color: Colors.black,
                    ))
                  : MaterialStatePropertyAll(Icon(
                      Icons.school,
                      color: Colors.black,
                    )),
              // inactiveTrackColor: customTheme.theme[theme]!["secondaryColor"],
              onChanged: (val) {
                setState(() {
                  isStaff = val;
                });
              })
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: !isStaff ? addStudent() : addStaff(),
    );
  }

  Widget addStudent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              picture(),
              name(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dateOfBirth(),
                  classSelector(),
                ],
              ),
              radioGroup("Gender", ["Male", "Female", "Undisclosed"]),
              guardianDetails(),
              contactDetails(),
              cta(),
            ],
          ),
        ),
      ),
    );
  }

  Widget addStaff() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              picture(),
              name(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dateOfBirth(),
                  classSelector(),
                  subjectSelector(),
                ],
              ),
              radioGroup("Gender", ["Male", "Female", "Undisclosed"]),
              radioGroup("Staff Type", ["Teaching", "Non - Teaching"],
                  enableSwitch: true, switchName: "Admin"),
              qualificationSelector(),
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color(0xFF4A4A4A),
                // lineStyle: DividerLineStyle.dashed,
              ),
              contactDetails(),
              cta(),
            ],
          ),
        ),
      ),
    );
  }

  Widget picture() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
              width: 110,
              height: 110,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5.0)],
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_add_alt,
                size: 45,
                color: customTheme.theme[theme]!["primaryColor"],
              )),
          Text(
            !isStaff
                ? 'Upload a photo for us to easily identify the student.'
                : 'Upload a photo for us to easily identify the Staff.',
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }

  Widget name() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: TextFormField(
            controller: phoneNumberController1,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'First Name',
              hintText: 'Student\'s First name here...',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
            ),
            // validator:
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: TextFormField(
            controller: phoneNumberController2,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Last Name',
              hintText: 'Student\'s Last name here...',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
            ),
            // validator: phoneNumberController2Validator
          ),
        ),
      ],
    );
  }

  Widget dateOfBirth() {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'DOB',
            suffixIcon: Icon(
              Icons.calendar_month,
              color: customTheme.theme[theme]!["secondaryColor"],
            ),
            filled: true,
            fillColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1)),
          ),
          controller: phoneNumberController3,
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2050));

            if (pickedDate != null) {
              phoneNumberController3.text = pickedDate.toString();
            }
          },
        ),
      ),
    );
  }

  Widget classSelector() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
      child: DropdownButton(
        value: selectedClass,
        hint: Text("Select Class"),
        items: classList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) => setState(() {
          selectedClass = value ?? "";
        }),
        elevation: 2,
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  Widget subjectSelector() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
      child: DropdownButton(
        value: selectedClass,
        hint: Text("Subjects"),
        items: classList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) => setState(() {
          selectedClass = value ?? "";
        }),
        elevation: 2,
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  Widget qualificationSelector() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
      child: DropdownButton(
        value: selectedClass,
        hint: const Text("Select Qualification of the Staff Member"),
        items: classList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) => setState(() {
          selectedClass = value ?? "";
        }),
        elevation: 2,
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  Widget radioGroup(String header, List<String> options,
      {bool enableSwitch = false, String switchName = ""}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22, 20, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(header),
              enableSwitch
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(switchName),
                          Switch(value: false, onChanged: (_) {}),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Radio
                ButtonBar(
                  buttonPadding: const EdgeInsets.all(0.0),
                  children: options.map<Widget>((value) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedRadio = 0;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: customTheme
                                  .theme[theme]!["secondaryBackgroundColor"],
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Radio(
                                  value: options.indexOf(value),
                                  groupValue: selectedRadio,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  onChanged: (val) {
                                    setState(() {
                                      selectedRadio = val!;
                                    });
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(value),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color(0xFF4A4A4A),
          // lineStyle: DividerLineStyle.dashed,
        ),
      ],
    );
  }

  Widget guardianDetails() {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Father'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Guardian'),
              )
            ],
            isSelected: toggleList1,
            borderColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
            color: customTheme.theme[theme]!["secondaryColor"],
            selectedColor: customTheme.theme[theme]!["tertiaryColor"],
            onPressed: (val) => setState(() {
              for (int index = 0; index < toggleList1.length; index++) {
                if (index == val) {
                  toggleList1[index] = !toggleList1[index];
                } else {
                  toggleList1[index] = false;
                }
              }
            }),
          ),
        ),
        toggleList1[0] || toggleList1[1]
            ? Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: TextFormField(
                        controller: phoneNumberController4,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          hintText: 'First name...',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: customTheme
                              .theme[theme]!["secondaryBackgroundColor"],
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        ),
                        // validator: phoneNumberController4Validator
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: TextFormField(
                        controller: phoneNumberController5,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Last name...',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: customTheme
                              .theme[theme]!["secondaryBackgroundColor"],
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        ),
                        // validator: phoneNumberController5Validator
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        !toggleList1[1]
            ? Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color(0xFF4A4A4A),
                // lineStyle: DividerLineStyle.dashed,
              )
            : Container(),
        !toggleList1[1]
            ? Align(
                alignment: AlignmentDirectional(0, 0),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Mother'),
                    ),
                  ],
                  isSelected: toggleList2,
                  borderColor:
                      customTheme.theme[theme]!["secondaryBackgroundColor"],
                  color: customTheme.theme[theme]!["secondaryColor"],
                  selectedColor: customTheme.theme[theme]!["tertiaryColor"],
                  onPressed: (val) => setState(() {
                    for (int index = 0; index < toggleList2.length; index++) {
                      if (index == val) {
                        toggleList2[index] = !toggleList2[index];
                      } else {
                        toggleList2[index] = false;
                      }
                    }
                  }),
                ),
              )
            : Container(),
        !toggleList1[1] && toggleList2[0]
            ? Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: TextFormField(
                        controller: phoneNumberController6,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          hintText: 'First name...',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: customTheme
                              .theme[theme]!["secondaryBackgroundColor"],
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        ),
                        // validator: phoneNumberController6Validator
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: TextFormField(
                        controller: phoneNumberController7,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Last name...',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: customTheme
                              .theme[theme]!["secondaryBackgroundColor"],
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        ),
                        // validator: phoneNumberController7Validator
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color(0xFF4A4A4A),
          // lineStyle: DividerLineStyle.dashed,
        ),
      ],
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                child: TextFormField(
                  controller: phoneNumberController8,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Primary Contact ',
                    hintText: 'Primary Contact...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor:
                        customTheme.theme[theme]!["secondaryBackgroundColor"],
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  keyboardType: TextInputType.phone,
                  // validator: phoneNumberController8Validator
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
                child: TextFormField(
                  controller: phoneNumberController9,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Secondary Contact ',
                    hintText: 'Secondary Contact...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor:
                        customTheme.theme[theme]!["secondaryBackgroundColor"],
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  keyboardType: TextInputType.phone,
                  // validator: phoneNumberController9Validator
                ),
              ),
            ),
          ],
        ),
        isStaff
            ? Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: TextFormField(
                  controller: phoneNumberController9,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    hintText: 'Email ID...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor:
                        customTheme.theme[theme]!["secondaryBackgroundColor"],
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  keyboardType: TextInputType.phone,
                  // validator: phoneNumberController9Validator
                ),
              )
            : Container(),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color(0xFF4A4A4A),
          // lineStyle: DividerLineStyle.dashed,
        ),
        Container(
          height: 150,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: TextFormField(
              controller: phoneNumberController10,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Address',
                hintText: 'Address...',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor:
                    customTheme.theme[theme]!["secondaryBackgroundColor"],
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              ),
              maxLines: 5,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              // validator: phoneNumberController10Validator
            ),
          ),
        ),
      ],
    );
  }

  Widget cta() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: OutlinedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  customTheme.theme[theme]!["secondaryBackgroundColor"]),
              foregroundColor: MaterialStatePropertyAll(
                  customTheme.theme[theme]!["tertiaryColor"]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Create Profile!',
                style: GoogleFonts.outfit(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 3,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Container(
          height: 100,
        ),
      ],
    );
  }
}
