import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widgets/custom_shimmer.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/hestorical_perod_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HestoricalPeriods extends StatelessWidget {
  const HestoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailure) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoading
            ? CustomShimmer(width: 164, height: 96)
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: context.read<HomeCubit>().historicalPeriods.length,
                  itemBuilder: (context, index) {
                    return HestoricalPeriodItem(
                      historicalModel: context
                          .read<HomeCubit>()
                          .historicalPeriods[index],
                    );
                  },
                ),
              );
      },
    );
  }
}
