import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class DateTimePickerController extends ValueNotifier<DateTime?> {
  DateTimePickerController({DateTime? value}) : super(value);

  @override
  set value(DateTime? newValue) {
    if (newValue != null) {
      super.value =
          DateTime.fromMicrosecondsSinceEpoch(newValue.microsecondsSinceEpoch);
      return;
    }
    super.value = null;
  }
}

class DateTimePickerAlt extends StatefulWidget {
  final DateTime? initialDate;
  final String formattingPattern;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? prefixIconColor;
  final DateTimePickerController? controller;
  final String? errorText;
  final TextStyle? errorTextStyle;
  final String? Function(DateTime? value)? validator;
  final AutovalidateMode autovalidateMode;
  final DateTime firstDate;
  final DateTime lastDate;

  const DateTimePickerAlt(
      {Key? key,
      this.initialDate,
      this.formattingPattern = 'yyyy-MM-dd',
      this.hintText,
      this.hintStyle,
      this.prefixIconColor,
      this.errorText,
      this.controller,
      this.errorTextStyle,
      this.validator,
      this.autovalidateMode = AutovalidateMode.disabled,
      required this.firstDate,
      required this.lastDate})
      : super(key: key);

  @override
  DateTimePickerAltState createState() => DateTimePickerAltState();
}

class DateTimePickerAltState extends State<DateTimePickerAlt> {
  late final DateTimePickerController controller;
  late String text;
  final _key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    text = widget.hintText ?? '';
    controller = widget.controller ??
        DateTimePickerController(value: widget.initialDate);
    super.initState();
  }

  void _validateWithUserInteraction() {
    switch (widget.autovalidateMode) {
      case AutovalidateMode.always:
        _key.currentState?.validate();
        break;
      case AutovalidateMode.onUserInteraction:
        _key.currentState?.validate();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      key: _key,
      autovalidateMode: widget.autovalidateMode,
      validator: (_) {
        return widget.validator?.call(controller.value);
      },
      builder: (state) {
        return GestureDetector(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(start: 2),
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    start: BorderSide(
                      color: !state.hasError
                          ? widget.prefixIconColor ?? Colors.white
                          : widget.errorTextStyle?.color ??
                              Theme.of(context).errorColor,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: widget.prefixIconColor ?? Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: widget.hintStyle ??
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.hasError || widget.errorText != null
                        ? Text(
                            state.errorText ?? widget.errorText ?? '',
                            style: widget.errorTextStyle ??
                                Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).errorColor,
                                    fontWeight: FontWeight.w600),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
          onLongPress: () {
            final _tmp = controller.value;
            setState(() {
              text = widget.hintText ?? '';
              controller.value = null;
            });
            if (_tmp != null) {
              _validateWithUserInteraction();
            }
          },
          onTap: () async {
            DateTime? _tmp = await showDatePicker(
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                context: context,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                initialDate: controller.value != null
                    ? controller.value!
                    : DateTime.now());
            if (_tmp != null) {
              setState(() {
                text = intl.DateFormat(widget.formattingPattern,
                        Localizations.localeOf(context).languageCode)
                    .format(_tmp);
                controller.value = _tmp;
              });
            }
            _validateWithUserInteraction();
          },
        );
      },
    );
  }
}
