import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/dashboard/model/meter_model.dart';
import 'package:grocery/dashboard/repository/dashboad_repo.dart';
import 'package:grocery/profile/model/profile_model.dart';
import 'package:grocery/profile/repository/profile_repo.dart';

var profileControllerProvider = Provider((ref) => ProfileController(ref.watch(profileRepProvider)));
var profileFutureProvider =
    FutureProvider<Profile>((ref) => ref.watch(profileControllerProvider).getProfileData());



class ProfileController {
  ProfileController(this.repo);

  ProfileRepo repo;

  Future<Profile> getProfileData() async {
    var response = await repo.getProfileData();

    return Profile.fromJson(response.data);
  }

}
