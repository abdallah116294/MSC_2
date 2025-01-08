import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';

class SpinBoxTextField extends StatefulWidget {
  @override
  _SpinBoxTextFieldState createState() => _SpinBoxTextFieldState();
}

class _SpinBoxTextFieldState extends State<SpinBoxTextField> {
  TextEditingController _controller = TextEditingController();
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = _value.toString();
  }

  void _increment() {
    setState(() {
      _value++;
      _controller.text = _value.toString();
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 0) _value--;
      _controller.text = _value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
    
      keyboardType: TextInputType.number,
      
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        suffixIcon: Column(
                mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: AppColor.primary,
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: _decrement,
            ),
            IconButton(
              color: AppColor.primary,
              icon: const Icon(Icons.arrow_drop_up),
              onPressed: _increment,
            ),
          ],
        ),
        border: const OutlineInputBorder(),
        labelText: 'age',
      ),
    );
  }
}
