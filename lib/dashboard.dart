import 'package:admin/add_member.dart';
import 'package:admin/student_detailed_view.dart';
import 'package:admin/theme/dark_theme.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final TextEditingController _searchQueryController = TextEditingController();
  TextEditingController ce = TextEditingController();
  String selectedExpense = "", searchQuery = "", theme = "dark";
  var customTheme = CustomTheme();

  bool floatExtended = false;
  List<String> expenseList = [
    "Tea",
    "Water Can",
    "Covers",
    "Comission",
    "Electricity Bill",
    "Stock",
    "Salary",
    "Rent",
    "Maintenance"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    DateTime today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customTheme.theme[theme]!["secondaryBackgroundColor"],
        title: Container(
          height: 55,
          decoration: BoxDecoration(
              color: customTheme.theme[theme]!["primaryBackgroundColor"],
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextField(
              controller: _searchQueryController,
              autofocus: false,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentSummaryPage(
                            name: "John Doe",
                            std: "4",
                            admissionNumber: "136",
                            guardianName: "Johnny Senior",
                            primaryContact: "4567834567",
                            secondaryContact: "4567834567",
                          ))),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: customTheme.theme[theme]!["primaryColor"],
                  size: 40,
                ),
                hintText: "Search...",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 18),
              ),
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              onChanged: (query) => updateSearchQuery(query),
            ),
          ),
        ),
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.notifications,
              size: 40,
              color: customTheme.theme[theme]!["primaryColor"],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.account_circle,
              size: 40,
              color: customTheme.theme[theme]!["primaryColor"],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CalendarTimeline(
                    initialDate: today,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2024),
                    onDateSelected: (_) {},
                    leftMargin: 120.0,
                    monthColor: customTheme.theme[theme]!["secondaryColor"],
                    activeBackgroundDayColor:
                        customTheme.theme[theme]!["primaryColor"],
                    dotsColor: customTheme.theme[theme]!["primaryColor"],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 16.0,
                                  ),
                                ],
                                color: Color.fromARGB(255, 33, 43, 46),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Attendance",
                                      style: TextStyle(
                                          color: customTheme
                                              .theme[theme]!["tertiaryColor"]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                              text: "226",
                                              style: TextStyle(
                                                  color: customTheme.theme[
                                                      theme]!["secondaryColor"],
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 18),
                                              children: [
                                                TextSpan(
                                                    text: " / ",
                                                    style: TextStyle(
                                                      color: customTheme
                                                              .theme[theme]![
                                                          "secondaryColor"],
                                                    )),
                                                TextSpan(
                                                    text: "254",
                                                    style: TextStyle(
                                                      color: customTheme
                                                              .theme[theme]![
                                                          "primaryColor"],
                                                    )),
                                              ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.8),
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 16.0,
                                      ),
                                    ],
                                    color: Color.fromARGB(255, 33, 43, 46),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Deadlines",
                                            style: TextStyle(
                                                color: customTheme.theme[
                                                    theme]!["tertiaryColor"]),
                                          )
                                        ],
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.8),
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 16.0,
                                      ),
                                    ],
                                    color: Color.fromARGB(255, 33, 43, 46),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Personal Notes",
                                            style: TextStyle(
                                                color: customTheme.theme[
                                                    theme]!["tertiaryColor"]),
                                          )
                                        ],
                                      ))),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2.0,
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payments",
                              style: TextStyle(
                                color:
                                    customTheme.theme[theme]!["tertiaryColor"],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TabBar(
                                isScrollable: true,
                                labelStyle: TextStyle(
                                  color:
                                      customTheme.theme[theme]!["primaryColor"],
                                ),
                                labelColor:
                                    customTheme.theme[theme]!["primaryColor"],
                                unselectedLabelColor:
                                    customTheme.theme[theme]!["secondaryColor"],
                                // overlayColor: MaterialStateProperty.all(Colors.amber),
                                // padding: EdgeInsets.all(5.0),
                                // labelColor: Colors.red,
                                dividerColor: Colors.white,
                                tabs: [
                                  Tab(text: "Week"),
                                  Tab(text: "Month"),
                                  Tab(text: "Year"),
                                ],
                                controller: _tabController,
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 80,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    paymentsKPI("2,300", "3,600"),
                                    paymentsKPI("18,000", "32,600"),
                                    paymentsKPI("210,300", "330,600"),
                                  ],
                                )),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "INVOICES",
                                    style: TextStyle(
                                        color: customTheme
                                            .theme[theme]!["tertiaryColor"]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text("See All"),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white12)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: 250,
                                height: 180,
                                child: ListView(
                                  children: [
                                    ExpansionTile(
                                        title: FittedBox(
                                            child:
                                                Text("Invoice #A938G32ff7r3"))),
                                    ExpansionTile(
                                        title: FittedBox(
                                            child:
                                                Text("Invoice #A938G32ff7r3"))),
                                    ExpansionTile(
                                        title: FittedBox(
                                            child:
                                                Text("Invoice #A938G32ff7r3")))
                                  ],
                                )),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Announcements",
                                    style: TextStyle(
                                        color: customTheme
                                            .theme[theme]!["tertiaryColor"]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white12)),
                                      child: const Text("See All"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: 550,
                                height: 90,
                                child: ListView(
                                  children: [
                                    // ExpansionTile(
                                    //     title: Flexible(
                                    //         child: Text(
                                    //   "Tomorrow is a holiday on account of XYZ",
                                    //   overflow: TextOverflow.ellipsis,
                                    // ))),
                                    ExpansionTile(
                                        title: FittedBox(
                                            child: Text(
                                                "SA1 exams will be starting from 1st May, 2023. The schedule will be shared to you shortly!"))),
                                    ExpansionTile(
                                        title: FittedBox(
                                            child: Text(
                                                "Summer Break would be starting from 18th May, 2023. Please ensure to complete your assignments & submit asap!")))
                                  ],
                                )),
                          ],
                        ),
                      )
                      // Neumorphic(
                      //       style: NeumorphicStyle(lightSource: LightSource.topRight,
                      //       depth: -5,
                      //       color: Color.fromARGB(255, 30, 37, 43),
                      //       shadowLightColor: Colors.white.withOpacity(0.1),
                      //       shadowDarkColor: Colors.black.withOpacity(0.4),
                      //       shape: NeumorphicShape.concave,
                      //         border: NeumorphicBorder(
                      //           color: Color(0x33000000),
                      //           width: 0.8,
                      //         )
                      //       ),
                      //       child: Container(
                      //         width: 200,
                      //         height: 400,
                      //         color: Color.fromARGB(255, 30, 37, 43),),
                      //     ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
          color: customTheme.theme[theme]!["secondaryBackgroundColor"],
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          // padding: EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            useLegacyColorScheme: false,
            elevation: 0,
            // iconSize: 20,
            // fixedColor: customTheme.theme[theme]!["primaryColor"],
            unselectedItemColor: customTheme.theme[theme]!["tertiaryColor"],
            // customTheme.theme[theme]!["secondaryColor"],
            selectedItemColor: customTheme.theme[theme]!["primaryColor"],
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document), label: "Billing"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.checklist), label: "Attendance"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Announcements"),
              BottomNavigationBarItem(icon: Container(width: 20), label: "")
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Add',
        label: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white12),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddMemberWidget()));
              },
              icon: Container(
                  child: Icon(
                Icons.person_add,
                color: Colors.blueAccent,
                size: 25,
              )),
              label: Text("Member"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white12),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ))),
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: addExpense,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    // barrierColor: Colors.transparent,
                    transitionDuration: const Duration(milliseconds: 150));
              },
              icon: Container(
                  child: Icon(
                Icons.monetization_on,
                color: Colors.blueAccent,
                size: 25,
              )),
              label: Text("Expense"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white12),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ))),
              onPressed: () {},
              icon: Container(
                  child: Icon(
                Icons.notifications_active,
                color: Colors.blueAccent,
                size: 25,
              )),
              label: Text("Alerts"),
            ),
          ),
        ]),
        isExtended: floatExtended,
        icon: floatExtended
            ? Container(
                color: Colors.white12,
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.red,
                  size: 35,
                ),
              )
            : Icon(
                Icons.post_add_rounded,
                color: Colors.blueAccent,
                size: 35,
              ),
        onPressed: () {
          setState(() {
            floatExtended = !floatExtended;
          });
        },
        backgroundColor:
            floatExtended == true ? Colors.transparent : Colors.white12,
      ),

      // FloatingActionButton(
      //   backgroundColor: customTheme.theme[theme]!["primaryColor"],
      //   child: Icon(
      //     Icons.add_rounded,
      //     color: customTheme.theme[theme]!["alternateColor"],
      //     size: 35,
      //   ),
      //   onPressed: () {},
      //   // label: Icon(Icons.add),
      // ),
    );
  }

  Widget paymentsKPI(recv, calc) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Center(
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                    text: "\$ ",
                    style: TextStyle(
                        color: customTheme.theme[theme]!["secondaryColor"],
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                    children: [
                      TextSpan(
                          text: recv,
                          style: TextStyle(
                            color: customTheme.theme[theme]!["secondaryColor"],
                          )),
                      TextSpan(
                          text: " / ",
                          style: TextStyle(
                            color: customTheme.theme[theme]!["secondaryColor"],
                          )),
                      TextSpan(
                          text: calc,
                          style: TextStyle(
                            color: customTheme.theme[theme]!["primaryColor"],
                          )),
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addExpense(BuildContext buildContext, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    selectedExpense = "";
    ce.clear();
    return SafeArea(
      child: Builder(builder: (context) {
        return AlertDialog(
            backgroundColor: customTheme.theme[theme]!["secondaryColor"],
            contentPadding: EdgeInsets.all(2.0),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                color: customTheme.theme[theme]!["primaryBackgroundColor"],
                width: 200.0,
                height: 180.0,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 180,
                            child: TextField(
                              controller: ce,
                              cursorColor: Colors.amber,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              // textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Amount",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                focusColor: Colors.amber,
                              ),
                            ),
                          ),
                          IconButton(
                              color: Colors.blueAccent,
                              padding: EdgeInsets.fromLTRB(0, 0, 45, 55),
                              onPressed: () {
                                int amnt = int.parse(ce.text);
                                if (amnt > 0) {
                                  int sales_count = 0;
                                  String zeroes = "000000", new_salesId = "";
                                  // sales.get().then(
                                  //   (value) {
                                  //     sales_count = value.docs.length;
                                  //     if ((sales_count).toString().length !=
                                  //         6) {
                                  //       int zeroes_needed =
                                  //           6 - (sales_count).toString().length;
                                  //       new_salesId = "S" +
                                  //           zeroes.substring(0, zeroes_needed) +
                                  //           (sales_count).toString();
                                  //       // sales.doc(new_salesId).set({
                                  //       //   "id": new_salesId,
                                  //       //   "items": selectedExpense,
                                  //       //   "timestamp": Timestamp.now(),
                                  //       //   "total_amount": amnt,
                                  //       //   "type": "Expense"
                                  //       //   // "payment": payment
                                  //       // });
                                  //       ce.clear();
                                  //     }
                                  //   },
                                  // );
                                }
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.check_box,
                                size: 80,
                                color: Colors.blueAccent,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(expenseList.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                backgroundColor: customTheme
                                    .theme[theme]!["secondaryBackgroundColor"],
                                selectedColor:
                                    customTheme.theme[theme]!["secondaryColor"],
                                label: Text(
                                  expenseList[index],
                                  style: TextStyle(
                                      color:
                                          selectedExpense != expenseList[index]
                                              ? Colors.white
                                              : Colors.black),
                                ),
                                selected: selectedExpense == expenseList[index],
                                onSelected: (selected) {
                                  setState(() {
                                    if (selectedExpense == expenseList[index]) {
                                      selectedExpense = "";
                                    } else {
                                      selectedExpense = expenseList[index];
                                    }
                                  });
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
      }),
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }
}
