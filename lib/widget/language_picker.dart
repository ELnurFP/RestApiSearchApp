import 'package:api_search_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? const Locale('en');
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      value: locale,
      icon: Container(
        width: 12,
      ),
      items: L10n.all.map((locale) {
        final name = L10n.getName(locale.languageCode);
        return DropdownMenuItem(
          child: Center(
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          value: locale,
          onTap: () {
            final provider =
                Provider.of<LocaleProvider>(context, listen: false);

            provider.setLocale(locale);
          },
        );
      }).toList(),
      onChanged: (value) {},
    ));
  }
}
