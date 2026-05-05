import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  static const routeName = '/grid-view';

  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gridItems = [
      _GridItem(Icons.phone_android, 'Mobile', Color(0xFFBCE4FF)),
      _GridItem(Icons.palette, 'Design', Color(0xFFFFE4D7)),
      _GridItem(Icons.code, 'Coding', Color(0xFFDADDF7)),
      _GridItem(Icons.bolt, 'Ideas', Color(0xFFFFF3B8)),
      _GridItem(Icons.group, 'Team', Color(0xFFDCEFDC)),
      _GridItem(Icons.cloud, 'Cloud', Color(0xFFE8F7FF)),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Grid View'), elevation: 1),
      body: Container(
        color: const Color(0xFFF1E9FF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.95,
            ),
            itemCount: gridItems.length,
            itemBuilder: (context, index) {
              final item = gridItems[index];
              return Container(
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        item.icon,
                        size: 28,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _GridItem {
  final IconData icon;
  final String label;
  final Color color;

  const _GridItem(this.icon, this.label, this.color);
}
