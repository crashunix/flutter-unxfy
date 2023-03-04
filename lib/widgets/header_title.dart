import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:unxfy/styles/app_styles.dart';

class HeaderTitle extends StatefulWidget {
  final String title;
  const HeaderTitle({Key? key, required this.title}) : super(key: key);

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: kInterSemiBold.copyWith(fontSize: 20)),
          GestureDetector(
            child: Container(
              // decoration: const BoxDecoration(color: kBlue),
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_selected == null)
                    Text('---.', style: kInterRegular.copyWith(fontSize: 12))
                  else
                    Text(DateFormat('MMM. yyyy').format(_selected!),
                        style: kInterRegular.copyWith(fontSize: 12)),
                  const Icon(
                    Icons.expand_more,
                    size: 16,
                  )
                ],
              ),
            ),
            onTap: () => _onMonthTap(context: context, locale: 'en'),
          )
        ]);
  }

  Future<void> _onMonthTap({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2024),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
