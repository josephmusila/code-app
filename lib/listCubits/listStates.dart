import 'package:equatable/equatable.dart';
import 'package:interview/models/customerListModel.dart';

abstract class CustomerListState extends Equatable{}


class InitialState extends CustomerListState{
  @override
  
  List<Object?> get props => throw UnimplementedError();
  
}


class LoadingCustomer extends CustomerListState{
  @override
  
  List<Object?> get props =>[];
  
}


class LoadedCustomer extends CustomerListState{
  CustomerListModel customers;

  LoadedCustomer({required this.customers});
  @override
  
  List<Object?> get props => [customers];
  
}


class LoadCustomerError extends CustomerListState{
  @override
  
  List<Object?> get props => [];
  
}