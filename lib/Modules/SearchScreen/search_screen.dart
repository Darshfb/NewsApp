import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/news_cubit.dart';
import 'package:newsapp/Layout/news_states.dart';
import 'package:newsapp/Modules/Widgets/custom_text_form_field.dart';
import 'package:newsapp/Shared/component.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextFormField(
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchController,
                  keyBoardType: TextInputType.text,
                  hintText: 'Search',
                  labelText: 'Search',
                  prefixIcon: Icons.search,
                  isDense: true,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return 'Search must not be empty';
                    } return null;
                  },
                ),
              ),
              Expanded(child: articleBuilder(list)),
            ],
          ),
        );
      },
    );
  }
}
