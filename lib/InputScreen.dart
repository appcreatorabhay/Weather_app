import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart'; // Import the second screen

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController _cityController = TextEditingController();
  String? _selectedCapital;

  // List of capitals for 29 states
  List<String> stateCapitals = [
    'Andhra Pradesh - Amaravati',
    'Arunachal Pradesh - Itanagar',
    'Assam - Dispur',
    'Bihar - Patna',
    'Chhattisgarh - Raipur',
    'Goa - Panaji',
    'Gujarat - Gandhinagar',
    'Haryana - Chandigarh',
    'Himachal Pradesh - Shimla',
    'Jharkhand - Ranchi',
    'Karnataka - Bengaluru',
    'Kerala - Thiruvananthapuram',
    'Madhya Pradesh - Bhopal',
    'Maharashtra - Mumbai',
    'Manipur - Imphal',
    'Meghalaya - Shillong',
    'Mizoram - Aizawl',
    'Nagaland - Kohima',
    'Odisha - Bhubaneswar',
    'Punjab - Chandigarh',
    'Rajasthan - Jaipur',
    'Sikkim - Gangtok',
    'Tamil Nadu - Chennai',
    'Telangana - Hyderabad',
    'Tripura - Agartala',
    'Uttar Pradesh - Lucknow',
    'Uttarakhand - Dehradun',
    'West Bengal - Kolkata',
    'Jammu and Kashmir - Srinagar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Weather Forecasting', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Set background color of screen to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCapital,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCapital = newValue;
                  _cityController.text = newValue!.split(' - ')[1];
                });
              },
              items: stateCapitals.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.split(' - ')[1]),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select State Capital',
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelStyle: TextStyle(fontSize: 16, color: Colors.black), // Set label text style
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelStyle: TextStyle(fontSize: 16, color: Colors.black), // Set label text style
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen with the entered city
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(city: _cityController.text),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Get Weather',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
