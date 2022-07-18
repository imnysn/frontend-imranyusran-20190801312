class DioResponse<T> {
  T? data;
  String? errorMessage;

  DioResponse({this.data, this.errorMessage = ''});
}