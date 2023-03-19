import 'package:flutter/material.dart';
import 'package:end_user/googlesheets.dart';
import 'package:end_user/sheetscolumn.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

// class _MainScreenState extends State<MainScreen> {
//   TextEditingController busnoController = new TextEditingController();
//   TextEditingController feedbackController = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: busnoController,
//               ),
//               TextFormField(
//                 controller: feedbackController,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   final feedback = {
//                     SheetsColumn.bus_number: busnoController.text.trim(),
//                     SheetsColumn.feedback: feedbackController.text.trim(),
//                   };
//
//                   await SheetsFlutter.insert([feedback]);
//                 },
//                 child: Container(
//                   height: 70,
//                   width: 400,
//                   color: Colors.red,
//                   child: Center(child: Text("Send to Sheets")),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
//   TextEditingController busnoController = new TextEditingController();
//   TextEditingController feedbackController = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               TextFormField(
//                 controller: busnoController,
//               ),
//               TextFormField(
//                 controller: feedbackController,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   final feedback = {
//                     SheetsColumn.bus_no: busnoController.text.trim(),
//
//                     SheetsColumn.feedback: feedbackController.text.trim(),
//                   };
//
//                   await SheetsFlutter.insert([feedback]);
//                 },
//                 child: Container(
//                   height: 70,
//                   width: 400,
//                   color: Colors.red,
//                   child: Center(child: Text("Send to Sheets")),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
  late AnimationController _controller;
  late Animation<double> _animation;
  TextEditingController busnoController = new TextEditingController();
  TextEditingController feedbackController = new TextEditingController();
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    busnoController.dispose();
    feedbackController.dispose();
    super.dispose();
  }

  void _submitFeedback() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    // Simulate network request delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Simulate network request success or failure
    if (busnoController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thank you!'),
          content: Text('Your feedback has been submitted.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FEEDBACK'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'We would love to hear your feedback!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 16.0),
                  ScaleTransition(
                    scale: _animation,
                    child: Icon(Icons.feedback_rounded, size: 96.0),
                  ),
                  SizedBox(height: 16.0),

                  TextFormField(
                    controller: busnoController,
                    decoration: const InputDecoration(
                      labelText: 'Bus Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: feedbackController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      // hintText: 'Enter your feedback here',
                      labelText: 'Enter your feedback here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      final feedback = {
                        SheetsColumn.bus_no: busnoController.text.trim(),

                        SheetsColumn.feedback: feedbackController.text.trim(),
                      };

                      await SheetsFlutter.insert([feedback]);
                    },
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('Submit Feedback'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (_isError)
                    const Text(
                      'Please enter your feedback before submitting.',
                      style: TextStyle(color: Colors.red),
                    ),
                ]
            )
        ),
      ),
    );
  }
}
