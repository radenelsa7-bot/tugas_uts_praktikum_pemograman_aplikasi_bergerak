import 'package:flutter/material.dart';

class NavigasiSederhanaPage extends StatelessWidget {
  static const routeName = '/navigasi-sederhana';

  const NavigasiSederhanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigasi Sederhana'), elevation: 1),
      body: Container(
        color: const Color(0xFFFBF6FF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7FF),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(126, 83, 255, 0.12),
                      blurRadius: 24,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E0FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.navigation,
                        size: 32,
                        color: Color(0xFF4F35A1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Navigasi Sederhana',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Buka halaman baru dengan sentuhan ringan dan kembali ke menu utama dengan mudah.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(
                          child: _MiniFeatureCard(
                            title: 'Transisi Halus',
                            icon: Icons.motion_photos_on,
                            color: Color(0xFFCDE8FF),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _MiniFeatureCard(
                            title: 'Mudah',
                            icon: Icons.touch_app,
                            color: Color(0xFFFFE8D3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SimpleDetailPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(0, 0.18),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeOut));
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              ),
                            );
                          },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB4DEFF),
                  foregroundColor: const Color(0xFF0A4B7B),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Buka Halaman Baru'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleDetailPage extends StatelessWidget {
  const SimpleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Detail'), elevation: 1),
      body: Container(
        color: const Color(0xFFFBF6FF),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7FF),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(126, 83, 255, 0.12),
                        blurRadius: 20,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        size: 40,
                        color: Color(0xFF4F35A1),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Ini adalah halaman baru.\nTekan kembali untuk kembali ke menu sebelumnya.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD3B6),
                    foregroundColor: const Color(0xFF7A4A24),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniFeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _MiniFeatureCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFF3ECFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
