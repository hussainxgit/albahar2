import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:albahar2/datastore/usersBox.dart';

class LeaveRequestForm extends StatefulWidget {
  @override
  _LeaveRequestFormState createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  final leaveRequestFormKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: 300,
      child: Form(
          key: leaveRequestFormKey,
          child: Column(
            children: [
              Text('Leave request'),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: TextField(
                  controller: TextEditingController(
                      text: formatter.format(selectedDate)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Leave start',
                      enabled: false),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  _selectDate2(context);
                },
                child: TextField(
                  controller: TextEditingController(
                      text: formatter.format(selectedDate2)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Leave end',
                      enabled: false),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 45,
                child: ElevatedButton.icon(
                    onPressed: () {
                      UsersBox.userPut('Hussain');
                    },
                    icon: Icon(Icons.send),
                    label: Text('Submit')),
              )
            ],
          )),
    );
  }
}
