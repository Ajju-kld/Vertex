class PostException implements Exception {
  final String message;
  PostException(this.message);

  @override
  String toString() => 'PostException: $message';
}

class PostNotFoundException extends PostException {
  PostNotFoundException(String postId)
      : super('Post with ID $postId not found');
}

class PostCreationFailedException extends PostException {
  PostCreationFailedException(String reason)
      : super('Failed to create post: $reason');
}

class PostDeletionFailedException extends PostException {
  PostDeletionFailedException(String postId, String reason)
      : super('Failed to delete post with ID $postId: $reason');
}

class PostsFetchFailedException extends PostException {
  PostsFetchFailedException(String reason)
      : super('Failed to fetch posts: $reason');
}

class CommentCreationFailedException extends PostException {
  CommentCreationFailedException(String postId, String reason)
      : super('Failed to create comment on post $postId: $reason');
}

class CommentsFetchFailedException extends PostException {
  CommentsFetchFailedException(String postId, String reason)
      : super('Failed to fetch comments for post $postId: $reason');
}

class PostLikeFailedException extends PostException {
  PostLikeFailedException(String postId, String reason)
      : super('Failed to like post $postId: $reason');
}

class PostUnlikeFailedException extends PostException {
  PostUnlikeFailedException(String postId, String reason)
      : super('Failed to unlike post $postId: $reason');
}
