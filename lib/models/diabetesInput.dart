class DiabetesInputModel {
  // Personal Information
  String? name;
  int? gender;
  int? age;
  int? familyHistoryDiabetes;
  int? gestationalDiabetes;
  int? polycysticOvarySyndrome;
  int? previousPreDiabetes;

  // BMI
  double? height;
  double? weight;
  double bmi;

  // Lifestyle
  int smoking;
  double alcoholConsumption;
  double physicalActivity;
  double dietQuality;
  double sleepQuality;

  // Life Quality and Environment
  double qualityOfLifeScore;
  int heavyMetalsExposure;
  int occupationalExposureChemicals;
  int waterQuality;

  // Medical Records
  double medicalCheckupsFrequency;
  double medicationAdherence;
  double healthLiteracy;

  // Symptoms
  int frequentUrination;
  int excessiveThirst;
  int unexplainedWeightLoss;
  double fatigueLevels;
  int blurredVision;
  int slowHealingSores;
  int tinglingHandsFeet;

  // Medical History
  int hypertension;
  int systolicBloodPressure;
  int diastolicBloodPressure;
  double fastingBloodSugar;
  double hbA1c;
  double serumCreatinine;
  double bunLevels;
  double cholesterolTotal;
  double cholesterolLDL;
  double cholesterolHDL;
  double cholesterolTriglycerides;

  // Prescribed Medication
  int antihypertensiveMedications;
  int statins;
  int antidiabeticMedications;


  //Constructor dengan default values
  DiabetesInputModel({
    this.name = "",
    this.gender = 1,
    this.age = 0,
    this.familyHistoryDiabetes = 0,
    this.gestationalDiabetes = 0,
    this.polycysticOvarySyndrome = 0,
    this.previousPreDiabetes = 0,
    this.height = 0.0,
    this.weight = 0.0,
    this.bmi = 18.5,
    this.smoking = 0,
    this.alcoholConsumption = 0.0,
    this.physicalActivity = 3.0,
    this.dietQuality = 3.0,
    this.sleepQuality = 7.0,
    this.qualityOfLifeScore = 7.0,
    this.heavyMetalsExposure = 0,
    this.occupationalExposureChemicals = 0,
    this.waterQuality = 5,
    this.medicalCheckupsFrequency = 1.0,
    this.medicationAdherence = 1.0,
    this.healthLiteracy = 3.0,
    this.frequentUrination = 0,
    this.excessiveThirst = 0,
    this.unexplainedWeightLoss = 0,
    this.fatigueLevels = 2.0,
    this.blurredVision = 0,
    this.slowHealingSores = 0,
    this.tinglingHandsFeet = 0,
    this.hypertension = 0,
    this.systolicBloodPressure = 120,
    this.diastolicBloodPressure = 80,
    this.fastingBloodSugar = 90.0,
    this.hbA1c = 5.5,
    this.serumCreatinine = 1.0,
    this.bunLevels = 15.0,
    this.cholesterolTotal = 180.0,
    this.cholesterolLDL = 100.0,
    this.cholesterolHDL = 50.0,
    this.cholesterolTriglycerides = 150.0,
    this.antihypertensiveMedications = 0,
    this.statins = 0,
    this.antidiabeticMedications = 0,
  });

  // Copy method untuk update sebagian nilai
  DiabetesInputModel copyWith({
    int? age,
    int? familyHistoryDiabetes,
    int? gestationalDiabetes,
    int? polycysticOvarySyndrome,
    int? previousPreDiabetes,
    double? bmi,
    int? smoking,
    double? alcoholConsumption,
    double? physicalActivity,
    double? dietQuality,
    double? sleepQuality,
    double? qualityOfLifeScore,
    int? heavyMetalsExposure,
    int? occupationalExposureChemicals,
    int? waterQuality,
    double? medicalCheckupsFrequency,
    double? medicationAdherence,
    double? healthLiteracy,
    int? frequentUrination,
    int? excessiveThirst,
    int? unexplainedWeightLoss,
    double? fatigueLevels,
    int? blurredVision,
    int? slowHealingSores,
    int? tinglingHandsFeet,
    int? hypertension,
    int? systolicBloodPressure,
    int? diastolicBloodPressure,
    double? fastingBloodSugar,
    double? hbA1c,
    double? serumCreatinine,
    double? bunLevels,
    double? cholesterolTotal,
    double? cholesterolLDL,
    double? cholesterolHDL,
    double? cholesterolTriglycerides,
    int? antihypertensiveMedications,
    int? statins,
    int? antidiabeticMedications,
  }) {
    return DiabetesInputModel(
      age: age ?? this.age,
      familyHistoryDiabetes: familyHistoryDiabetes ?? this.familyHistoryDiabetes,
      gestationalDiabetes: gestationalDiabetes ?? this.gestationalDiabetes,
      polycysticOvarySyndrome: polycysticOvarySyndrome ?? this.polycysticOvarySyndrome,
      previousPreDiabetes: previousPreDiabetes ?? this.previousPreDiabetes,
      bmi: bmi ?? this.bmi,
      smoking: smoking ?? this.smoking,
      alcoholConsumption: alcoholConsumption ?? this.alcoholConsumption,
      physicalActivity: physicalActivity ?? this.physicalActivity,
      dietQuality: dietQuality ?? this.dietQuality,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      qualityOfLifeScore: qualityOfLifeScore ?? this.qualityOfLifeScore,
      heavyMetalsExposure: heavyMetalsExposure ?? this.heavyMetalsExposure,
      occupationalExposureChemicals: occupationalExposureChemicals ?? this.occupationalExposureChemicals,
      waterQuality: waterQuality ?? this.waterQuality,
      medicalCheckupsFrequency: medicalCheckupsFrequency ?? this.medicalCheckupsFrequency,
      medicationAdherence: medicationAdherence ?? this.medicationAdherence,
      healthLiteracy: healthLiteracy ?? this.healthLiteracy,
      frequentUrination: frequentUrination ?? this.frequentUrination,
      excessiveThirst: excessiveThirst ?? this.excessiveThirst,
      unexplainedWeightLoss: unexplainedWeightLoss ?? this.unexplainedWeightLoss,
      fatigueLevels: fatigueLevels ?? this.fatigueLevels,
      blurredVision: blurredVision ?? this.blurredVision,
      slowHealingSores: slowHealingSores ?? this.slowHealingSores,
      tinglingHandsFeet: tinglingHandsFeet ?? this.tinglingHandsFeet,
      hypertension: hypertension ?? this.hypertension,
      systolicBloodPressure: systolicBloodPressure ?? this.systolicBloodPressure,
      diastolicBloodPressure: diastolicBloodPressure ?? this.diastolicBloodPressure,
      fastingBloodSugar: fastingBloodSugar ?? this.fastingBloodSugar,
      hbA1c: hbA1c ?? this.hbA1c,
      serumCreatinine: serumCreatinine ?? this.serumCreatinine,
      bunLevels: bunLevels ?? this.bunLevels,
      cholesterolTotal: cholesterolTotal ?? this.cholesterolTotal,
      cholesterolLDL: cholesterolLDL ?? this.cholesterolLDL,
      cholesterolHDL: cholesterolHDL ?? this.cholesterolHDL,
      cholesterolTriglycerides: cholesterolTriglycerides ?? this.cholesterolTriglycerides,
      antihypertensiveMedications: antihypertensiveMedications ?? this.antihypertensiveMedications,
      statins: statins ?? this.statins,
      antidiabeticMedications: antidiabeticMedications ?? this.antidiabeticMedications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'familyHistoryDiabetes': familyHistoryDiabetes,
      'gestationalDiabetes': gestationalDiabetes,
      'polycysticOvarySyndrome': polycysticOvarySyndrome,
      'previousPreDiabetes': previousPreDiabetes,
      'bmi': bmi,
      'smoking': smoking,
      'alcoholConsumption': alcoholConsumption,
      'physicalActivity': physicalActivity,
      'dietQuality': dietQuality,
      'sleepQuality': sleepQuality,
      'qualityOfLifeScore': qualityOfLifeScore,
      'heavyMetalsExposure': heavyMetalsExposure,
      'occupationalExposureChemicals': occupationalExposureChemicals,
      'waterQuality': waterQuality,
      'medicalCheckupsFrequency': medicalCheckupsFrequency,
      'medicationAdherence': medicationAdherence,
      'healthLiteracy': healthLiteracy,
      'frequentUrination': frequentUrination,
      'excessiveThirst': excessiveThirst,
      'unexplainedWeightLoss': unexplainedWeightLoss,
      'fatigueLevels': fatigueLevels,
      'blurredVision': blurredVision,
      'slowHealingSores': slowHealingSores,
      'tinglingHandsFeet': tinglingHandsFeet,
      'hypertension': hypertension,
      'systolicBloodPressure': systolicBloodPressure,
      'diastolicBloodPressure': diastolicBloodPressure,
      'fastingBloodSugar': fastingBloodSugar,
      'hbA1c': hbA1c,
      'serumCreatinine': serumCreatinine,
      'bunLevels': bunLevels,
      'cholesterolTotal': cholesterolTotal,
      'cholesterolLDL': cholesterolLDL,
      'cholesterolHDL': cholesterolHDL,
      'cholesterolTriglycerides': cholesterolTriglycerides,
      'antihypertensiveMedications': antihypertensiveMedications,
      'statins': statins,
      'antidiabeticMedications': antidiabeticMedications,
    };
  }

  List<double> toList() {
    return [
      age?.toDouble() ?? 0.0,                                 // 0
      bmi,                                                    // 1
      smoking.toDouble(),                                     // 2
      alcoholConsumption,                                     // 3
      physicalActivity,                                       // 4
      dietQuality,                                            // 5
      sleepQuality,                                           // 6
      familyHistoryDiabetes?.toDouble() ?? 0.0,               // 7
      gestationalDiabetes?.toDouble() ?? 0.0,                 // 8
      polycysticOvarySyndrome?.toDouble() ?? 0.0,             // 9
      previousPreDiabetes?.toDouble() ?? 0.0,                 // 10
      hypertension.toDouble(),                                // 11
      systolicBloodPressure.toDouble(),                       // 12
      diastolicBloodPressure.toDouble(),                      // 13
      fastingBloodSugar,                                      // 14
      hbA1c,                                                  // 15
      serumCreatinine,                                        // 16
      bunLevels,                                              // 17
      cholesterolTotal,                                       // 18
      cholesterolLDL,                                         // 19
      cholesterolHDL,                                         // 20
      cholesterolTriglycerides,                               // 21
      antihypertensiveMedications.toDouble(),                 // 22
      statins.toDouble(),                                     // 23
      antidiabeticMedications.toDouble(),                     // 24
      frequentUrination.toDouble(),                           // 25
      excessiveThirst.toDouble(),                             // 26
      unexplainedWeightLoss.toDouble(),                       // 27
      fatigueLevels,                                          // 28
      blurredVision.toDouble(),                               // 29
      slowHealingSores.toDouble(),                            // 30
      tinglingHandsFeet.toDouble(),                           // 31
      qualityOfLifeScore,                                     // 32
      heavyMetalsExposure.toDouble(),                         // 33
      occupationalExposureChemicals.toDouble(),               // 34
      waterQuality.toDouble(),                                // 35
      medicalCheckupsFrequency,                               // 36
      medicationAdherence,                                    // 37
      healthLiteracy,                                         // 38
    ];
  }

}


