import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layout',
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // MediaQuery
    final size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layout"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Text(
              "Screen Width: $width",
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              "Screen Height: $height",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            // LayoutBuilder
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {

                  if (constraints.maxWidth < 600) {

                    // Mobile Layout
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.orange,
                            child: const Center(
                              child: Text(
                                "Mobile Layout",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                "Mobile Content",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                  } else {

                    // Tablet / Desktop Layout
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.orange,
                            child: const Center(
                              child: Text(
                                "Tablet Sidebar",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                "Tablet Content",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}