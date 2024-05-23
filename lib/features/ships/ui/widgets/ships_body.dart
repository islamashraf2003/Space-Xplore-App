import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/logic/cubit/ships_cubit.dart';
import 'package:space_app/features/ships/logic/cubit/ships_state.dart';
import 'package:space_app/features/ships/ui/widgets/all_category_of_ships.dart';

class ShipsBody extends StatefulWidget {
  const ShipsBody({super.key});

  @override
  State<ShipsBody> createState() => _ShipsBodyState();
}

class _ShipsBodyState extends State<ShipsBody> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ShipsCubit, ShipsState>(
        builder: (context, state) {
          final cubit = ShipsCubit.get(context);
          List<ShipModel> allShips = cubit.allShips;
          if (state is ShipsFailure) {
            return FailedRequestColumn(
              fetchData: _fetchData,
            );
          } else if (state is ShipsLoading) {
            return const CustomLoadingWidget();
          } else {
            return RefreshIndicator(
              color: ColorsManager.mainColor,
              onRefresh: () async {
                cubit.page = 1;
                _fetchData();
              },
              child: Column(
                children: [
                  AllCategoryOfShips(
                    ships: allShips,
                  ),
                  state is LoadingMoreShips
                      ? Center(
                          child: SpinKitThreeBounce(
                            size: 30.sp,
                            color: ColorsManager.mainColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _fetchData() {
    BlocProvider.of<ShipsCubit>(context).getAllShipsData();
  }
}
