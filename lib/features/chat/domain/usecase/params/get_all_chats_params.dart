/// [GetAllChatsParams] API params
class GetAllChatsParams {
  /// [GetAllChatsParams] constructor
 const GetAllChatsParams({required this.index, required this.perPage});

  /// [index] of current page
  final int index;

  /// [perPage] how many items shown on per page
  final int perPage;
}
