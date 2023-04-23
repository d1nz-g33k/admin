import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/material.dart' hide Image;
// import 'package:oktoast/oktoast.dart';
import 'package:admin/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentSummaryPage extends StatefulWidget {
  final String name;
  final String std;
  final String admissionNumber;
  final String guardianName;
  final String primaryContact;
  final String secondaryContact;

  StudentSummaryPage({
    required this.name,
    required this.std,
    required this.admissionNumber,
    required this.guardianName,
    required this.primaryContact,
    required this.secondaryContact,
  });

  @override
  _StudentSummaryPageState createState() => _StudentSummaryPageState(
      this.name,
      this.std,
      this.admissionNumber,
      this.guardianName,
      this.primaryContact,
      this.secondaryContact);
}

class _StudentSummaryPageState extends State<StudentSummaryPage> {
  final String name;
  final String std;
  final String admissionNumber;
  final String guardianName;
  final String primaryContact;
  final String secondaryContact;

  _StudentSummaryPageState(this.name, this.std, this.admissionNumber,
      this.guardianName, this.primaryContact, this.secondaryContact);

  String theme = "dark";
  var customTheme = CustomTheme();

  PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  // FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice _device = BluetoothDevice();

  @override
  void initState() {
    super.initState();

    Permission.bluetoothScan.isDenied.then((value) {
      Permission.bluetooth.request();
      Permission.bluetoothConnect.request();
      Permission.bluetoothScan.request();
      if (value)
        print("_____________Denied___________");
      else
        print("_________Accepted_________");
    });

    _device.name = "MPT-II";
    _device.address = "66:32:67:7E:FD:7A";

    // _device.name = "P58D";
    // _device.address = "02:25:93:C4:E5:D7";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style:
                  GoogleFonts.outfit(fontStyle: FontStyle.normal, fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: customTheme.theme[theme]!["primaryColor"],
              ),
            ),
          ],
        ),
        // actions: [],
        backgroundColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(name),
              Text('Admission Number: $admissionNumber'),
              Text('Class: $std'),
              Text('Guardian Name: $guardianName'),
              Text('Primary Contact: $primaryContact'),
              Text('Secondary Contact: $secondaryContact'),
              SizedBox(height: 20.0),
              ExpansionTile(
                  title: Text(
                    'Attendance Summary',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SA1'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.8,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('80%'),
                        ],
                      ),
                      children: [
                        ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text('Total Classes'),
                          trailing: Text('50'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('Classes Attended'),
                          trailing: Text('45'),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text('Classes Missed'),
                          trailing: Text('5'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SA2'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('70%'),
                        ],
                      ),
                      children: [
                        ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text('Total Classes'),
                          trailing: Text('50'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('Classes Attended'),
                          trailing: Text('35'),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text('Classes Missed'),
                          trailing: Text('15'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('FA1'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.9,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('90%'),
                        ],
                      ),
                    ),
                  ]),
              SizedBox(height: 20.0),
              ExpansionTile(
                  title: Text(
                    'Marks Summary',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SA1'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.8,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('80%'),
                        ],
                      ),
                      children: [
                        ListTile(
                          leading: Icon(Icons.score),
                          title: Text('Total Marks'),
                          trailing: Text('500'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('Marks Obtained'),
                          trailing: Text('400'),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text('Marks Missed'),
                          trailing: Text('100'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SA2'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('70%'),
                        ],
                      ),
                      children: [
                        ListTile(
                          leading: Icon(Icons.score),
                          title: Text('Total Marks'),
                          trailing: Text('500'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('Marks Obtained'),
                          trailing: Text('350'),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text('Marks Missed'),
                          trailing: Text('150'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('FA1'),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.9,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('90%'),
                        ],
                      ),
                      children: [
                        ListTile(
                          leading: Icon(Icons.score),
                          title: Text('Total Marks'),
                          trailing: Text('200'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('Marks Obtained'),
                          trailing: Text('180'),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text('Marks Missed'),
                          trailing: Text('20'),
                        ),
                      ],
                    ),
                  ]),
              SizedBox(height: 20.0),
              ExpansionTile(
                title: Text(
                  'Fee Summary',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ExpansionTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text('Fee Dues'),
                    children: [
                      ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text('Tuition Fee'),
                        trailing: Text('\$5000'),
                      ),
                      ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text('Transport Fee'),
                        trailing: Text('\$2000'),
                      ),
                      ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text('Books Fee'),
                        trailing: Text('\$1000'),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.receipt_long),
                    title: Text('Invoices Paid'),
                    children: [
                      ListTile(
                        leading: Icon(Icons.receipt),
                        title: Text('Tuition Fee'),
                        trailing: Text('\$4000'),
                      ),
                      ListTile(
                        leading: Icon(Icons.receipt),
                        title: Text('Transport Fee'),
                        trailing: Text('\$2000'),
                      ),
                      ListTile(
                        leading: Icon(Icons.receipt),
                        title: Text('Books Fee'),
                        trailing: Text('\$800'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          printReceipt(PrinterBluetooth(_device));
        },
        child: Icon(Icons.receipt_long),
      ),
    );
  }

  Future<List<int>> receipt(PaperSize paper, CapabilityProfile profile) async {
    final Generator ticket = Generator(paper, profile);
    List<int> bytes = [];

    // Print image
    // final ByteData data = await rootBundle.load('assets/rabbit_black.jpg');
    // final Uint8List imageBytes = data.buffer.asUint8List();
    // final Image? image = decodeImage(imageBytes);
    // bytes += ticket.image(image);

    bytes += ticket.text('School Name',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    bytes += ticket.text('School Address Line 1',
        styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Street Name, Building Name, City - Pincode',
        styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Tel: 720-XXXX-755',
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    bytes += ticket.hr();
    bytes += ticket.row([
      PosColumn(text: 'Qty', width: 1),
      PosColumn(text: 'Item', width: 7),
      PosColumn(
          text: 'Price', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: 'Total', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    // invoice.forEach((val) {
    //   bytes += ticket.row([
    //     PosColumn(text: val["qty"].toString(), width: 1),
    //     PosColumn(text: val["name"], width: 7),
    //     PosColumn(
    //         text: val['price'].toString(),
    //         width: 2,
    //         styles: PosStyles(align: PosAlign.right)),
    //     PosColumn(
    //         text: (val['price'] * val['qty']).toString(),
    //         width: 2,
    //         styles: PosStyles(align: PosAlign.right)),
    //   ]);
    // });
    bytes += ticket.row([
      PosColumn(text: "1", width: 1),
      PosColumn(text: "Tution Fee", width: 7),
      PosColumn(
          text: "3000", width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: "3000", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += ticket.row([
      PosColumn(text: "10", width: 1),
      PosColumn(text: "Books", width: 7),
      PosColumn(
          text: "100", width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: "1000", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.hr();

    bytes += ticket.row([
      PosColumn(
          text: 'TOTAL',
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
      PosColumn(
          text: "\$4000",
          // text: "₹" + total.toString(),
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
    ]);

    bytes += ticket.hr(ch: '=', linesAfter: 1);

    bytes += ticket.feed(2);
    bytes += ticket.text('Thank you!',
        styles: PosStyles(align: PosAlign.center, bold: true));

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timestamp = formatter.format(now);
    bytes += ticket.text(timestamp,
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);

    // Print QR Code from image
    // try {
    //   const String qrData = 'example.com';
    //   const double qrSize = 200;
    //   final uiImg = await QrPainter(
    //     data: qrData,
    //     version: QrVersions.auto,
    //     gapless: false,
    //   ).toImageData(qrSize);
    //   final dir = await getTemporaryDirectory();
    //   final pathName = '${dir.path}/qr_tmp.png';
    //   final qrFile = File(pathName);
    //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
    //   final img = decodeImage(imgFile.readAsBytesSync());

    //   bytes += ticket.image(img);
    // } catch (e) {
    //   print(e);
    // }

    // Print QR Code using native function
    // bytes += ticket.qrcode('example.com');

    ticket.feed(2);
    ticket.cut();
    return bytes;
  }

  void printReceipt(PrinterBluetooth printer) async {
    printerManager.selectPrinter(printer);

    // TODO Don't forget to choose printer's paper
    const PaperSize paper = PaperSize.mm58;
    final profile = await CapabilityProfile.load();

    // TEST PRINT
    // final PosPrintResult res =
    // await printerManager.printTicket(await testTicket(paper));

    // DEMO RECEIPT
    final PosPrintResult res =
        await printerManager.printTicket((await receipt(paper, profile)));

    // showToast(res.msg);
  }
}
