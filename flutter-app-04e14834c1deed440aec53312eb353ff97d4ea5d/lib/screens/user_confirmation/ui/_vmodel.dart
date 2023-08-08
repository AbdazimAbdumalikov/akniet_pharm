import 'package:dio/dio.dart';
import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/widgets/main_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PersonalInfoVModel {
  final BuildContext context;
  late final firstName = AppTextField(
    hintText: S.current.first_name,
    validator: _validate,
  );
  late final lastName = AppTextField(
    hintText: S.current.last_name,
    validator: _validate,
  );
  late final dateOfBirth = AppTextField(
    hintText: S.current.date_of_birth,
    readonly: true,
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 13.0),
      child: GestureDetector(
        child: SvgPicture.asset(
          "assets/images/svg/calendar.svg",
          color: ColorPalette.main,
        ),
        onTap: () => _datePick(
          isBirth: true,
        ),
      ),
    ),
    // validator: _validate,
  );
  late final iin = AppTextField(
    hintText: S.current.iin,
    validator: _validate,
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(12),
    ],
  );
  late final carRightsNumber = AppTextField(
    hintText: S.current.car_rights_number,
    validator: _validate,
  );
  late final carRightsExpire = AppTextField(
    hintText: S.current.car_rights_expire,
    readonly: true,
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 13.0),
      child: GestureDetector(
        child: SvgPicture.asset(
          "assets/images/svg/calendar.svg",          color: ColorPalette.main,

        ),
        onTap: () => _datePick(
          isCarExpire: true,
        ),
      ),
    ),
  );
  late final carType = AppTextField(
    hintText: S.current.car_mark,
    validator: _validate,
  );
  late final carModel = AppTextField(
    hintText: S.current.car_model,
    validator: _validate,
  );
  List<String> images = [];
  String rightsPicture = "";
  String? markId = "1";

  Future<Map<String, dynamic>> toJson() async {
    return {
      "name": firstName.controller.text,
      "surname": lastName.controller.text,
      "date": dateOfBirth.controller.text,
      "iin": iin.controller.text,
      "doc_number": carRightsNumber.controller.text,
      "deadline": carRightsExpire.controller.text,
      "image_1": await MultipartFile.fromFile(images.first),
      "image_2": await MultipartFile.fromFile(images.last),
      "person_image": await MultipartFile.fromFile(rightsPicture),
      "mark_model_id": markId,
      "car_date": carIssueDate.controller.text,
      "dimensions": carDimensions.controller.text,
      "number": governmentNumber.controller.text,
      "registration": "drc/image-registration",
      "image": await MultipartFile.fromFile(rightsPicture),
    };
  }

  bool isFilled() {
    return firstName.controller.text.isNotEmpty &&
        lastName.controller.text.isNotEmpty &&
        dateOfBirth.controller.text.isNotEmpty &&
        iin.controller.text.isNotEmpty &&
        carRightsNumber.controller.text.isNotEmpty &&
        carRightsExpire.controller.text.isNotEmpty &&
        images.length == 2 &&
        rightsPicture.isNotEmpty &&
        carIssueDate.controller.text.isNotEmpty &&
        carDimensions.controller.text.isNotEmpty &&
        governmentNumber.controller.text.isNotEmpty;
  }

  late final carIssueDate = AppTextField(
    hintText: S.current.car_issue_date,
    readonly: true,
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 13.0),
      child: GestureDetector(
        child: SvgPicture.asset(
          "assets/images/svg/calendar.svg",          color: ColorPalette.main,

        ),
        onTap: () => _datePick(
          isCarIssue: true,
        ),
      ),
    ),
  );
  late final carDimensions = AppTextField(
    hintText: S.current.car_dimensions,
    validator: _validate,
  );
  late final governmentNumber = AppTextField(
    hintText: S.current.government_number,
    validator: _validate,
  );
  late final registrationCertificate = AppTextField(
    hintText: S.current.registration_certificate,
    validator: _validate,
  );
  String selectedDate = '';

  PersonalInfoVModel(this.context);

  bool get firstStepValidated => [
        firstName.validated,
        dateOfBirth.validated,
        lastName.validated,
        iin.validated,
      ].every(
        (result) => result == true,
      );

  bool get secondStepValidated => [
        carRightsNumber.validated,
        carRightsExpire.validated,
      ].every(
        (result) => result == true,
      );

  bool get lastStepValidated => [
        carType.validated,
        carIssueDate.validated,
        carDimensions.validated,
        governmentNumber.validated,
        registrationCertificate.validated,
      ].every(
        (result) => result == true,
      );

  List<String> _validate(String? value) {
    if (value!.isEmpty) {
      return [S.current.fill_field];
    }
    return [];
  }

  Future<void> _datePick({
    bool isCarExpire = false,
    bool isCarIssue = false,
    bool isBirth = false,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
// <<<<<<< HEAD

      // firstDate: DateTime(1950),
      // lastDate: DateTime.now(),
      // locale: Locale("ru", "RU"),
// =======
      firstDate: isCarExpire ? DateTime.now():DateTime(1950),
      lastDate: isCarExpire ?DateTime(2050) :DateTime.now(),
        locale: const Locale("ru", "RU"),
// >>>>>>> 36e53e6b986836e3147d9cebf7998ea384e715b8
    );
    if (date != null) {
      if (isBirth) {
        dateOfBirth.controller.text = DateFormat("yyyy-dd-MM").format(date);
      }
      if (isCarExpire) {
        carRightsExpire.controller.text = DateFormat("yyyy-dd-MM").format(date);
      }
      if (isCarIssue) {
        carIssueDate.controller.text = DateFormat("yyyy-dd-MM").format(date);
      }
    }
  }
}
