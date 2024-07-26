// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'contactus.dart';
import 'hotel1.dart';
import 'hotel2.dart';
import 'hotel3.dart';
import 'hotel4.dart';
import 'hotel5.dart';
import 'resort1.dart';
import 'resort2.dart';
import 'resort3.dart';
import 'resort4.dart';
import 'resort5.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up & Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  // ignore: unused_field
  String _password = '';
  bool _passwordVisible = false;
  bool _hasUppercase = false;
  bool _hasNumber = false;
  bool _hasSpecialCharacter = false;
  bool _hasMinLength = false;

  bool _showLengthValidation = false;
  bool _showUppercaseValidation = false;
  bool _showNumberValidation = false;
  bool _showSpecialCharValidation = false;

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        setState(() {
          _showLengthValidation = false;
          _showUppercaseValidation = false;
          _showNumberValidation = false;
          _showSpecialCharValidation = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _updateValidationIndicators(String value) {
    setState(() {
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasNumber = value.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacter = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      _hasMinLength = value.length >= 8;

      if (value.isNotEmpty) _showLengthValidation = true;
      if (_hasUppercase) _showUppercaseValidation = true;
      if (_hasNumber) _showNumberValidation = true;
      if (_hasSpecialCharacter) _showSpecialCharValidation = true;
    });
  }

  Widget _buildValidationIcon(bool condition) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: condition ? Colors.green : Colors.red,
      ),
      child: Center(
        child: Icon(
          condition ? Icons.check : Icons.close,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestInBatangas'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Message
                Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 32),
                // Sign Up Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!value.contains('@')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_passwordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one uppercase letter';
                          } else if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Password must contain at least one number';
                          } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                        onChanged: _updateValidationIndicators,
                        onSaved: (value) => _password = value!,
                      ),
                      if (_showLengthValidation)
                        Row(
                          children: [
                            _buildValidationIcon(_hasMinLength),
                            Text(' 8 characters or more'),
                          ],
                        ),
                      if (_showUppercaseValidation)
                        Row(
                          children: [
                            _buildValidationIcon(_hasUppercase),
                            Text(' At least one uppercase letter'),
                          ],
                        ),
                      if (_showNumberValidation)
                        Row(
                          children: [
                            _buildValidationIcon(_hasNumber),
                            Text(' At least one number'),
                          ],
                        ),
                      if (_showSpecialCharValidation)
                        Row(
                          children: [
                            _buildValidationIcon(_hasSpecialCharacter),
                            Text(' At least one special character'),
                          ],
                        ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showLengthValidation = true;
                            _showUppercaseValidation = true;
                            _showNumberValidation = true;
                            _showSpecialCharValidation = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(username: _email)),
                            );
                          }
                        },
                        child: Text('Log In'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestInBatangas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 165, 165, 165),
              ),
              child: Text(
                'RestInBatangas',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 221, 221),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile and Notifications Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpeg'),
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Welcome, $username!',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Search and Filter Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Handle filter
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Recommended Section
              const Text(
                'Hotels',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of recommended locations
                  itemBuilder: (context, index) {
                    return RecommendedCard(index: index);
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Top Destinations Section
              const Text(
                'Beach Resort',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of top destinations
                  itemBuilder: (context, index) {
                    return DestinationCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final int index;
  const RecommendedCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hotelNames = ['Oktowaves Hotel', 'RedDoorz Hotel', 'Cilex Hotel', 'Meaco Royal Hotel', 'Taal Maranan Hotel'];
    final images = [
      'assets/hotel1.jpg',
      'assets/hotel2.jpg',
      'assets/hotel3.jpg',
      'assets/hotel4.jpg',
      'assets/hotel5.png',
    ];
    final prices = ['P778 per night', 'P3,000 per head', 'P4,000 per head', 'P5,000 per head', 'P6,000 per head'];
    final locations = ['Nasugbu, Batangas', 'Philippines, Manila', 'Philippines, Cebu', 'Philippines, Davao', 'Philippines, Baguio'];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            switch (index) {
              case 0:
                return const Hotel1();
              case 1:
                return const Hotel2();
              case 2:
                return const Hotel3();
              case 3:
                return const Hotel4();
              case 4:
                return const Hotel5();
              default:
                return const Hotel1();
            }
          }),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.black54],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelNames[index],
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  prices[index],
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  locations[index],
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final int index;
  const DestinationCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hotelNames = ['Virgin Beach Resort', 'Club Balai Isabel', 'Buceo Anilao Resort', 'Camp Netanya', 'Club Punta Fuego'];
    final images = [
      'assets/hotel3_1.jpg',
      'assets/hotel3_2.jpg',
      'assets/hotel2_1.jpg',
      'assets/hotel4_1.jpg',
      'assets/hotel5_1.png',
    ];
    final prices = ['P8,000 per night', 'P5,000 per night', 'P6,000 per night', 'P7,000 per night', 'P6,000 per night'];
    final locations = ['San Juan, Batangas', 'Talisay, Batangas', 'Mabini, Batangas', 'Mabini, Batangas', 'Nasugbu, Batangas'];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            var index;
            switch (index) {
              case 0:
                return const Resort1();
              case 1:
                return const Resort2();
              case 2:
                return const Resort3();
              case 3:
                return const Resort4();
              case 4:
                return const Resort5();
              default:
                return const Resort1();
            }
          }),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.black54],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelNames[index],
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  prices[index],
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  locations[index],
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







