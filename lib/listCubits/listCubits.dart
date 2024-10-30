

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/authCubits/authServices.dart';
import 'package:interview/listCubits/listStates.dart';
import 'package:interview/models/customerListModel.dart';

class CustomerListCubits extends Cubit<CustomerListState>{
  Authservices authservices;

  CustomerListCubits({required this.authservices}):super(InitialState());

  void getCustomers() async{
    emit(LoadingCustomer());
    var res = await authservices.getCustomers();
    if(res is CustomerListModel){
      emit(LoadedCustomer(customers: res));
    }else{
      emit(LoadCustomerError());
    }
  }


}