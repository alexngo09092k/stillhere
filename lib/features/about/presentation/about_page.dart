import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:still_here/common/configuration.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

/// Privacy / About (FR-014).
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      if (mounted) {
        setState(() => _version = '${info.version}+${info.buildNumber}');
      }
    });
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final business = Configuration.instance.business;
    final links = business.webLinks;

    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        title: Text(
          s.aboutTitle,
          style: TextStyle(color: context.appInk),
        ),
        iconTheme: IconThemeData(color: context.appInk),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: context.appBrand.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_rounded,
                size: 36,
                color: context.appBrand,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            business.appName.isNotEmpty ? business.appName : 'StillHere',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: context.appInk,
            ),
          ),
          if (_version.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              _version,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: context.appInk.withOpacity(0.5),
              ),
            ),
          ],
          const SizedBox(height: 24),
          _Card(
            children: [
              Text(
                s.privacyBody,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: context.appInk.withOpacity(0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _Card(
            children: [
              Text(
                s.aboutAiNote,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: context.appInk.withOpacity(0.75),
                ),
              ),
            ],
          ),
          if (links.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              s.legalLinks,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: context.appInk.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 8),
            _Card(
              children: [
                for (var i = 0; i < links.length; i++) ...[
                  if (i > 0) const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(links[i].title),
                    trailing: Icon(Icons.open_in_new, size: 18),
                    onTap: () => _openLink(links[i].link),
                  ),
                ],
              ],
            ),
          ],
          const SizedBox(height: 24),
          Text(
            s.dataStaysOnDevice,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: context.appInk.withOpacity(0.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  const _Card({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.appSurf,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.appBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
