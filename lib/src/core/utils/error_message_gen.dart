import '../error/failures.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String BOOKMARK_FAILURE_MESSAGE = 'Bookmark Failure';

String mapFailureToMessage(Failure failure) {
  // Instead of a regular 'if (failure is ServerFailure)...'
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case LocalFailure:
      return BOOKMARK_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
