import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Time Picker"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                _dateTime.year.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: _showDatePicker,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Tarih Seç",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                _timeOfDay.format(context).toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: _showTimePicker,
                child: const Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Text(
                    "Saat Seç",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // datetime gösteren method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  // time gösteren method
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }
}
