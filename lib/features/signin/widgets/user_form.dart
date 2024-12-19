import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/signin/widgets/sign_up_button.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true; // State for password visibility
  String? _selectedExperience;

  final List<String> _seniorityLevels = [
    'Junior',
    'Mid-Level',
    'Senior',
    'Lead',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Phone Number Field
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: '   123 456_7890 ',
                  labelStyle: CustomstextStyels.font20black700Wight
                      .copyWith(fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                initialCountryCode: 'EG', // Default country code
                onChanged: (phone) {
                  // Automatically format with +02
                  _phoneController.text = '+20${phone.number}';
                  print('Complete phone number: ${_phoneController.text}');
                },
                validator: (phone) {
                  if (phone == null || phone.completeNumber.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),

              //experince
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Years of experience...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              // Years of Experience Dropdown
              // Seniority Level Dropdown
              DropdownButtonFormField<String>(
                value: _selectedExperience,
                items: _seniorityLevels
                    .map((level) => DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedExperience = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Choose experience Level',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your seniority level';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15.h),

              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        _obscureText
                            ? 'assets/images/svg/eye.svg'
                            : 'assets/images/svg/eye.svg',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              //signUp Button
              SignUpButton(
                nameController: TextEditingController(),
                passwordController: TextEditingController(),
                yearsOfexperinceController: TextEditingController(),
                expernceLevelController: TextEditingController(),
                addressController: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
