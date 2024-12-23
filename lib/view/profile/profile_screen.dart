import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/view/profile/widgets/container_data_profile.dart';

import '../../view_model/profile_controller/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(context: context),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
              body: ConditionalBuilder(
                condition: ProfileCubit.get(context).dataProfile != null,
                builder: (context) => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(15.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        containerDataProfile(
                            title: 'Name',
                            data: ProfileCubit.get(context)
                                .dataProfile['displayName'],
                            isCopied: false,
                            context: context),
                        20.ph,
                        containerDataProfile(
                            title: 'Phone',
                            data: ProfileCubit.get(context)
                                .dataProfile['username'],
                            isCopied: true,
                            context: context),
                        20.ph,
                        containerDataProfile(
                            title: 'Level',
                            data:
                                ProfileCubit.get(context).dataProfile['level'],
                            isCopied: false,
                            context: context),
                        20.ph,
                        containerDataProfile(
                            title: 'Years of experience',
                            data: ProfileCubit.get(context)
                                .dataProfile['experienceYears']
                                .toString(),
                            isCopied: false,
                            context: context),
                        20.ph,
                        containerDataProfile(
                            title: 'Location',
                            data: ProfileCubit.get(context)
                                .dataProfile['address'],
                            isCopied: false,
                            context: context),
                      ],
                    ),
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ));
        },
      ),
    );
  }
}
