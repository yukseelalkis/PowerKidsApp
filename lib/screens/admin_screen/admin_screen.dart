import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              //rgb(254, 255, 210)
              Color.fromRGBO(254, 255, 210, 1),
              Color.fromRGBO(255, 191, 120, 1)
            ],
          ),
        ),
        child: SizedBox(
          height: 1000,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Kayıt",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                const RegistrationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with saving the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form başarıyla kaydedildi')),
      );
    } else {
      // Form is invalid, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doğru doldurun')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Öğrenci Adı",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  labelText: "Öğrenci Soyadı",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const TCextField(
            labelText: "Tcno",
          ),
          const SizedBox(height: 20.0),
          const DatePickerField(),
          const SizedBox(height: 20.0),
          const CustomEmailField(
            labelText: "Veli Mail",
          ),
          const SizedBox(height: 20.0),
          const Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Baba Adı",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTelField(
                  labelText: "Tel",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Anne Adı",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTelField(
                  labelText: "Tel",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomElevatedButton(
              text: "KAYDET",
              onPressed: _submitForm,
            ),
          ),
        ],
      ),
    );
  }
}

// Widgetlarimiz

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        UpperCaseTextFormatter(), // UpperCaseTextFormatter to ensure all text is uppercase
      ],
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: const TextStyle(color: Colors.red), // Hata mesajı rengi
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText giriniz';
        }
        return null;
      },
    );
  }
}

class CustomTelField extends StatelessWidget {
  const CustomTelField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
        CustomTelFormatter(),
        UpperCaseTextFormatter(), // UpperCaseTextFormatter to ensure all text is uppercase
      ],
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: const TextStyle(color: Colors.red), // Hata mesajı rengi
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText giriniz';
        } else if (value.length < 11) {
          return 'Geçerli bir telefon numarası giriniz';
        }
        return null;
      },
    );
  }
}

class CustomTelFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    String formatted = '';

    if (text.isNotEmpty) {
      formatted += text.substring(0, 1); // 0
    }
    if (text.length > 1) {
      formatted +=
          ' ${text.substring(1, text.length > 4 ? 4 : text.length)}'; // 0XXX
    }
    if (text.length > 4) {
      formatted +=
          ' ${text.substring(4, text.length > 7 ? 7 : text.length)}'; // 0XXX XXX
    }
    if (text.length > 7) {
      formatted +=
          ' ${text.substring(7, text.length > 9 ? 9 : text.length)}'; // 0XXX XXX XX
    }
    if (text.length > 9) {
      formatted += ' ${text.substring(9, text.length)}'; // 0XXX XXX XX XX
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class TCextField extends StatelessWidget {
  const TCextField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
        UpperCaseTextFormatter(), // UpperCaseTextFormatter to ensure all text is uppercase
      ],
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: const TextStyle(color: Colors.red), // Hata mesajı rengi
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText giriniz';
        } else if (value.length != 11) {
          return 'Geçerli bir Tcno giriniz';
        }
        return null;
      },
    );
  }
}

class CustomEmailField extends StatelessWidget {
  final String labelText;

  const CustomEmailField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        UpperCaseTextFormatter(), // UpperCaseTextFormatter to ensure all text is uppercase
      ],
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: const TextStyle(color: Colors.red), // Hata mesajı rengi
      ),
      validator: (value) {
        const String emailPattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Mail adresi giriniz';
        } else if (!regExp.hasMatch(value)) {
          return "Hatalı giriş";
        }
        return null;
      },
    );
  }
}

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Doğum Tarihi',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red), // Hata mesajı rengi
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Doğum Tarihi giriniz';
        }
        return null;
      },
    );
  }
}

// Text input formatter to convert text to uppercase
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.orange,
          backgroundColor: Colors.white, // Arka plan rengi
          side: const BorderSide(color: Colors.orange), // Kenarlık rengi
          textStyle: const TextStyle(
            color: Colors.orange, // Yazı rengi
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 5.0, // Gölge efekti
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.orange, // Yazı rengi
          ),
        ),
      ),
    );
  }
}
