import 'package:flutter/material.dart';

class Hotel4 extends StatefulWidget {
  const Hotel4({super.key});

  @override
  _Hotel4State createState() => _Hotel4State();
}

class _Hotel4State extends State<Hotel4> {
  bool _showDescription = false;
  bool _showAmenities = false;
  bool _showRoomsAndRates = false;
  bool _showReviews = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meaco Royal Hotel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row of images
            Container(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  Image.asset('assets/hotel3_1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/hotel3_2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/hotel3_3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/hotel3_4.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Hotel Name
            const Text(
              'Meaco Royal Hotel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Hotel Location
            const Text(
              'Batangas City',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            // Hotel Description
            Material(
              elevation: 4.0, // Shadow effect
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Known for its affordability, this hotel provides comfortable'
                      'rooms starting at P1,466',
                      style: TextStyle(fontSize: 16),
                      maxLines: _showDescription ? null : 2,
                      overflow: _showDescription ? null : TextOverflow.ellipsis,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showDescription = !_showDescription;
                        });
                      },
                      child: Text(_showDescription ? 'Show Less' : 'Show More'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Amenities and Rooms and Rates Section
            Row(
              children: [
                // Amenities Section
                Expanded(
                  child: Material(
                    elevation: 4.0, // Shadow effect
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Amenities',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_showAmenities) ...[
                                const Text('• Private Bathroom'),
                                const Text('• Free Wi-Fi'),
                                const Text('• Air Conditioning'),
                                const Text('• Shower Room'),
                                const Text('• 24-hour Room Service'),
                                const Text('• Flat-screen TV'),
                                const Text('• Free toiletries'),
                              ] else ...[
                                const Text('• Private Bathroom'),
                                const Text('• Free Wi-Fi'),
                                const Text('• Air Conditioning'),
                                const Text('• Shower Room'),
                                const Text('• 24-hour Room Service'),
                              ],
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showAmenities = !_showAmenities;
                              });
                            },
                            child: Text(_showAmenities ? 'Show Less' : 'Show More'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                // Rooms and Rates Section
                Expanded(
                  child: Material(
                    elevation: 4.0, // Shadow effect
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rooms and Rates',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_showRoomsAndRates) ...[
                                const Text('• Standard Double Room - P855 per night'),
                                const Text('• SD Double Room Pro - P1023 per night'),
                                const Text('• Triple Room - P1,106 per night'),
                              ] else ...[
                                const Text('• Standard Double Room - P855 per night'),
                                const Text('• SD Double Room Pro - P1023 per night'),
                              ],
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showRoomsAndRates = !_showRoomsAndRates;
                              });
                            },
                            child: Text(_showRoomsAndRates ? 'Show Less' : 'Show More'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Reviews Section
            Material(
              elevation: 4.0, // Shadow effect
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reviews',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_showReviews) ...[
                          const Text('"Amazing experience! The view of Taal Volcano is stunning." - Alice'),
                          const Text('"Top-notch service and amenities. Will definitely come back!" - Bob'),
                          const Text('"A perfect getaway for relaxation and luxury." - Carol'),
                        ] else ...[
                          const Text('"Amazing experience! The view of Taal Volcano is stunning." - Alice'),
                        ],
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showReviews = !_showReviews;
                        });
                      },
                      child: Text(_showReviews ? 'Show Less' : 'Show More'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
