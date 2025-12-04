import 'package:flutter/material.dart';

class CountryCode {
  final String code;
  final String dialCode;
  CountryCode(this.code, this.dialCode);
}

final List<CountryCode> _dummyCountries = [
  CountryCode('US', '+1'),
  CountryCode('IN', '+91'),
  CountryCode('GB', '+44'),
  CountryCode('CA', '+1'),
  CountryCode('AU', '+61'),
  CountryCode('DE', '+49'),
  CountryCode('FR', '+33'),
  CountryCode('JP', '+81'),
];

class PhoneNumberInputField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const PhoneNumberInputField({super.key, this.initialValue, this.onChanged});

  @override
  State<PhoneNumberInputField> createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  CountryCode _selectedCountry = _dummyCountries.first;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(_onTextChanged);

    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();

    // Dispose FocusNode
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedCountry.dialCode + _controller.text);
    }
  }

  Future<void> _openCountryPicker() async {
    final selected = await showDialog<CountryCode>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          title: const Text(
            'Select Country',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _dummyCountries.length,
              itemBuilder: (context, index) {
                final country = _dummyCountries[index];
                return ListTile(
                  title: Text(
                    '${country.code} (${country.dialCode})',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(country);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedCountry = selected;
        _onTextChanged();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final primaryColor = Theme.of(context).primaryColor;
    const backgroundColor = Color(0xFF1C1C1E);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: isFocused
            ? Border.all(color: primaryColor.withOpacity(0.8), width: 1.5)
            : Border.all(color: Colors.white10, width: 1.0),
        boxShadow: isFocused
            ? [BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 6)]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          const Text(
            'Phone Number*',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),

          Row(
            children: [
              InkWell(
                onTap: _openCountryPicker,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCountry.code,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
              ),

              Text(
                _selectedCountry.dialCode,
                style: const TextStyle(fontSize: 18, color: Colors.white54),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '(555) 000-0000',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none, // Removes the underline
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
