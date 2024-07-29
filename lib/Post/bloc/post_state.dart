part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}


class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoaded extends PostState {
  final List<String> posts;
  const PostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {
  final String error;
  const PostError(this.error);
  @override
  List<Object> get props => [error];
}

class PostCreated extends PostState {
  final Post post;
  const PostCreated(this.post);
  @override
  List<Object> get props => [post];
}

class PostDeleted extends PostState {
  final String postId;
  const PostDeleted(this.postId);
  @override
  List<Object> get props => [postId];
}

class PostCommentLoaded extends PostState {
  final List<Comment> comments;
  const PostCommentLoaded(this.comments);
  @override
  List<Object> get props => [comments];
}

class  PostCommentAdded extends PostState {
  final Comment comment;
  const PostCommentAdded(this.comment);
  @override
  List<Object> get props => [comment];
}

class PostLiked extends PostState {
  final String postId;
  const PostLiked(this.postId);
  @override
  List<Object> get props => [postId];
}

class PostUnliked extends PostState {
  final String postId;
  const PostUnliked(this.postId);
  @override
  List<Object> get props => [postId];
}

class PostCommentLiked extends PostState {
  final String commentId;
  const PostCommentLiked(this.commentId);
  @override
  List<Object> get props => [commentId];
}

class FeedPostLoaded extends PostState {
  final List<Post> posts;
  const FeedPostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

