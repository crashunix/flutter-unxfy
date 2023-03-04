import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:unxfy/styles/app_styles.dart';

class HeaderValue extends StatefulWidget {
  final String label;
  final double value;

  const HeaderValue({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  State<HeaderValue> createState() => _HeaderValueState();
}

class _HeaderValueState extends State<HeaderValue> {
  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(
        amount: widget.value,
        settings: MoneyFormatterSettings(
            symbol: 'R\$',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: '',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: kInterRegular.copyWith(fontSize: 12, color: kGrey)),
        Text(fmf.output.symbolOnLeft,
            style: kOpenSansSemiBold.copyWith(fontSize: 32)),
      ],
    );
  }
}
