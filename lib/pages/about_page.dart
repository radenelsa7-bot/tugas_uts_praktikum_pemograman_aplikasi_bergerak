import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';

  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya'), elevation: 1),
      body: Container(
        color: const Color(0xFFFBF6FF),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE4FF),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(126, 83, 255, 0.12),
                          blurRadius: 24,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 22,
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: 'profile-photo',
                          child: CircleAvatar(
                            radius: 68,
                            backgroundColor: const Color(0xFFE2D9FF),
                            child: CircleAvatar(
                              radius: 62,
                              backgroundImage: const AssetImage(
                                'assets/images/01.jpeg',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'R.ELSA BALQIS KHOERUNNISA S.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '20241320062',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            _InfoChip(icon: Icons.school, label: 'Mahasiswa'),
                            SizedBox(width: 10),
                            _InfoChip(icon: Icons.code, label: 'Flutter'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _SkillMiniCard(
                                color: const Color(0xFFE9E3FF),
                                label: 'Kreatif',
                                sublabel: 'Desain UI',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _SkillMiniCard(
                                color: const Color(0xFFFDE8F0),
                                label: 'Bersemangat',
                                sublabel: 'Belajar Flutter',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3E9FF),
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(46, 29, 114, 0.08),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentang Saya',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3FA),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Text(
                            'Saya tertarik dalam pengembangan aplikasi Flutter. Saya suka membangun antarmuka yang bersih, sederhana, dan responsif. Saya ingin terus belajar dan membuat portofolio yang menarik.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, height: 1.6),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Fitur Utama',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: const [
                            _FeatureCard(
                              title: 'Antarmuka Rapi',
                              subtitle:
                                  'Desain minimalis dan penggunaan warna yang lembut.',
                              color: Color(0xFFE8E0FF),
                              icon: Icons.palette,
                            ),
                            SizedBox(height: 12),
                            _FeatureCard(
                              title: 'Mudah Dipahami',
                              subtitle:
                                  'Navigasi sederhana dan pengalaman yang intuitif.',
                              color: Color(0xFFFFE3E7),
                              icon: Icons.touch_app,
                            ),
                            SizedBox(height: 12),
                            _FeatureCard(
                              title: 'Belajar Terus',
                              subtitle:
                                  'Suka mempelajari konsep baru dan memperbaiki kode.',
                              color: Color(0xFFDFF6FF),
                              icon: Icons.school,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Keahlian',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: const [
                            _SkillChip(
                              label: 'Flutter',
                              color: Color(0xFFE8E0FF),
                            ),
                            _SkillChip(
                              label: 'UI/UX',
                              color: Color(0xFFFFE3E7),
                            ),
                            _SkillChip(
                              label: 'Mobile',
                              color: Color(0xFFDFF6FF),
                            ),
                            _SkillChip(
                              label: 'Design',
                              color: Color(0xFFFFF2D8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        icon,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(20),
    );
  }
}

class _SkillMiniCard extends StatelessWidget {
  final Color color;
  final String label;
  final String sublabel;

  const _SkillMiniCard({
    required this.color,
    required this.label,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(sublabel, style: const TextStyle(fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final Color color;

  const _SkillChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFF8E8FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.grey.shade900, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
