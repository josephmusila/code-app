import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/listCubits/listCubits.dart';
import 'package:interview/listCubits/listStates.dart';
import 'package:interview/loginScreen.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  @override
  void initState() {
    context.read<CustomerListCubits>().getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Customers"),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CustomerListCubits, CustomerListState>(
            builder: (context, state) {
              if (state is LoadingCustomer) {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              } else if (state is LoadedCustomer) {
                return ListView(
                    children:
                        List.generate(state.customers.response.length, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: ListTile(
                      title: Text(
                          "Names: ${state.customers.response[index].firstName} ${state.customers.response[index].otherNames}"),
                      subtitle: Text(
                          "Email: ${state.customers.response[index].email}"),
                    ),
                  );
                }));
              } else {
                return Column(
                  children: [
                    Text("an error occured"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(onPressed: () {}, child: Text("Retry"))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
