import 'dart:async';

import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/dto_models/response/profile_response.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/services/firebase_messaging_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'parts/_read.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.repository,
    required this.firebaseMessagingRepository,
  }) : super(ProfileStateLoading()) {
    on<ProfileEventInitial>(_read);
  }

  final GlobalRepository repository;
  final FirebaseMessagingRepository firebaseMessagingRepository;
}
