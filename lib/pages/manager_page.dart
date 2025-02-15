import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/manager/account_service.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _ServiceAccounts());
  }
}

class _ServiceAccounts extends StatelessWidget {
  const _ServiceAccounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Accounts manager")),
        body: Column(children: [
          Text('Comic services', style: Theme.of(context).textTheme.bodyMedium),
          DynamicHeightGridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.all(8.0),
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 10.0,
            //   childAspectRatio: 1/3,
            // ),
            itemCount: comicServices.length,
            builder: (context, index) {
              return _buildCard(comicServices[index]);
            },
          ),
          SizedBox(height: 15.0),
          Text('Eiga services', style: Theme.of(context).textTheme.bodyMedium),
          DynamicHeightGridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.all(8.0),
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 10.0,
            //   childAspectRatio: 1/3,
            // ),
            itemCount: eigaServices.length,
            builder: (context, index) {
              return _buildCard(eigaServices[index]);
            },
          ),
        ]));
  }

  Widget _buildCard(Service service) {
    return AccountService(
        key: Key(DateTime.now().millisecond.toString()), service: service);
  }
}
