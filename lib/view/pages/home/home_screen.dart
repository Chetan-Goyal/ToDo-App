import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            defaultPaddingWrapper(
              size: _size,
              child: Row(
                children: [
                  Icon(Icons.menu, size: 0.09 * _size.width),
                  const Spacer(),
                  Icon(Icons.search, size: 0.09 * _size.width),
                  SizedBox(width: 0.05 * _size.width),
                  Icon(Icons.notifications, size: 0.09 * _size.width),
                ],
              ),
            ),
            SizedBox(height: 0.1 * _size.width),
            defaultPaddingWrapper(
              size: _size,
              child: const Text('What\'s up, Chetan!'),
            ),
            SizedBox(height: 0.11 * _size.width),
            defaultPaddingWrapper(size: _size, child: const Text('CATEGORIES')),
            SizedBox(height: 0.08 * _size.width),
            SizedBox(
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: BoxConstraints.tight(
                          Size(170, 90)
                          ),
                      color: Colors.yellow,
                    ),
                  );
                },
                itemCount: 40,
              ),
            ),
            SizedBox(height: 0.1 * _size.width),
          ],
        ),
      ),
    );
  }

  defaultPaddingWrapper({required Widget child, required Size size}) {
    return Padding(
      padding: EdgeInsets.all(0.08 * size.width),
      child: child,
    );
  }
}
