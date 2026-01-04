abstract class LayoutStates {}

class AddCategorySuccesState extends LayoutStates {
  final int index;
  AddCategorySuccesState({required this.index});
}

class LayoutInitialState extends LayoutStates {}

class DeleteSuccessState extends LayoutStates {}

class EditSuccesState extends LayoutStates {}

class SetState extends LayoutStates {}

class FilterState extends LayoutStates {}

class SetDataState extends LayoutStates {}

class AddDataState extends LayoutStates {}

class LayoutLoading extends LayoutStates {}

class LayoutSuccess extends LayoutStates {}

class LowValueState extends LayoutStates {}

class LayoutFailure extends LayoutStates {
  final String erroMessage;
  LayoutFailure(this.erroMessage);
}
