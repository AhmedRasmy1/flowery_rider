import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  // الانتقال للصفحة التالية
  void _nextStep() {
    if (_currentStep < 4) {
      _currentStep++;
      _pageController.animateToPage(
        _currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  // العودة للصفحة السابقة
  void _previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      _pageController.animateToPage(
        _currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 5.0,
                    color: index <= _currentStep ? Colors.green : Colors.grey[300],
                  ),
                );
              }),
            ),
          ),

          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // تعطيل التمرير اليدوي
              children: [
                Center(child: Text('Step 1: Order Accepted', style: TextStyle(fontSize: 18.0))),
                Center(child: Text('Step 2: Preparing Order', style: TextStyle(fontSize: 18.0))),
                Center(child: Text('Step 3: Out for Delivery', style: TextStyle(fontSize: 18.0))),
                Center(child: Text('Step 4: Delivered', style: TextStyle(fontSize: 18.0))),
                Center(child: Text('Step 5: Completed', style: TextStyle(fontSize: 18.0))),
              ],
            ),
          ),

          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentStep > 0 ? _previousStep : null,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentStep < 4 ? _nextStep : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
