import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';
import 'package:Madhumeha/widgets/dropDown.dart';
import 'package:intl/intl.dart';
import 'package:Madhumeha/screens/input_screens/bmi.dart';

class PersonalInformation extends StatefulWidget {
  PersonalInformation(
      {super.key}); // Tambahkan super.key untuk StatelessWidget //jadi kalau di scroll dia tidak berubah
  @override
  State<StatefulWidget> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  //Input Box
  TextEditingController nameController = TextEditingController(); //membuat controller manggil TextEditingController dari inputBox.dart
  final TextEditingController birthDateController = TextEditingController();

  //Slider
  double alchoholConsumption = 0.0;

  //Dropdown
  String? selectedGender;

  //Toggle Primary Button
  bool familyHistoryDiabetes = false;
  bool gestationalDiabetes = false;
  bool polycysticOvarySyndrome = false;


  //Method untuk BirtDate Picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime.now()
    );

  if (picked != null) {
    setState(() {
      birthDateController.text = DateFormat('dd-MM-yyyy').format(picked);});
    }
  }

  //Method Toogle Button
  void _familyHistoryDiabetes(bool value) {
    setState(() {
      familyHistoryDiabetes = value;
    });
}

  void _gestationalDiabetes(bool value) {
    setState(() {
      gestationalDiabetes = value;
    });
}

  void _polycysticOvarySyndrome(bool value) {
    setState(() {
      polycysticOvarySyndrome = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                SizedBox(
                  child:
                  Text(
                    textAlign: TextAlign.start,
                    'Personal Information',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  child:
                  Text(
                    textAlign: TextAlign.start,
                    'You can change this information later',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 40,),
                //Name
                InputBox( //menggunakan widget InputBox
                  label: 'Name',
                  controller: nameController,
                  hint: 'Enter your name',
                  keyboardType: TextInputType.text,
                ),
                //Gender
                DropDown(
                  label: 'Gender',
                  items: ['Select Gender','Male', 'Female'],
                  initialValue: selectedGender ?? 'Select Gender',
                  onChanged: (value){
                    if (value != 'Select Gender') {
                      setState(() {
                        selectedGender = value;
                      });
                    }
                  },
                ),
                //Birth Date
                const SizedBox(height: 20,),
                InputBox(
                  label: 'Birth Date',
                  controller: birthDateController,
                  hint: 'dd-mm-yyyy',
                  isDatePicker: true,
                  onTap: () => _selectDate(context)),
                SizedBox(height: 20),
                //Family History Diabetes
                SizedBox(
                  child: Text(
                    'Family History Diabetes',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    //True
                    Expanded(
                        child: PrimaryButton(
                            label: 'True',
                            isToggle: true,
                            isSelected: familyHistoryDiabetes,
                            color: familyHistoryDiabetes ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            textColor: familyHistoryDiabetes ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _familyHistoryDiabetes(true))
                    ),
                    SizedBox(width: 8),
                    //False
                    Expanded(
                        child: PrimaryButton(
                            label: 'False',
                            isToggle: true,
                            isSelected: !familyHistoryDiabetes,
                            color: familyHistoryDiabetes ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            width: double.infinity, //menggunakan double.infinity agar button memenuhi layar
                            textColor: familyHistoryDiabetes ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _familyHistoryDiabetes(false))
                    ),
                  ],
                ),
                //Gestational Diabetes
                SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    'Gestational Diabetes',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    //True
                    Expanded(
                        child: PrimaryButton(
                            label: 'True',
                            isToggle: true,
                            isSelected: gestationalDiabetes,
                            color: gestationalDiabetes ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            textColor: gestationalDiabetes ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _gestationalDiabetes(true))
                    ),
                    SizedBox(width: 8),
                    //False
                    Expanded(
                        child: PrimaryButton(
                            label: 'False',
                            isToggle: true,
                            isSelected: !gestationalDiabetes,
                            color: gestationalDiabetes ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            width: double.infinity, //menggunakan double.infinity agar button memenuhi layar
                            textColor: gestationalDiabetes ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _gestationalDiabetes(false))
                    ),
                  ],
                ),
                //Polycystic Ovary Syndrome
                SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    'Polycystic Ovary Syndrome',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    //True
                    Expanded(
                        child: PrimaryButton(
                            label: 'True',
                            isToggle: true,
                            isSelected: polycysticOvarySyndrome,
                            color: polycysticOvarySyndrome ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            textColor: polycysticOvarySyndrome ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _polycysticOvarySyndrome(true))
                    ),
                    SizedBox(width: 8),
                    //False
                    Expanded(
                        child: PrimaryButton(
                            label: 'False',
                            isToggle: true,
                            isSelected: polycysticOvarySyndrome,
                            color: polycysticOvarySyndrome ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
                            width: double.infinity, //menggunakan double.infinity agar button memenuhi layar
                            textColor: polycysticOvarySyndrome ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).textTheme.bodySmall!.color!,
                            onPressed: () => _polycysticOvarySyndrome(false))
                    ),
                  ],
                ),
                //
                PrimaryButton(
                    label: 'Next',
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).scaffoldBackgroundColor,
                    width: 180,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BMI() ));}
                )
              ],
            ),
          )
        ],
      ),
      ),
    );
  }

}
