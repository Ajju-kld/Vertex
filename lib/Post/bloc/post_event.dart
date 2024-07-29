part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadAllPosts extends PostEvent {
  const LoadAllPosts();
}

class AddUserPost extends PostEvent {
  final Post postContent;
  const AddUserPost(this.postContent);

  @override
  List<Object> get props => [postContent];
}

class DeleteUserPost extends PostEvent {
  final String postId;
  const DeleteUserPost(this.postId);

  @override
  List<Object> get props => [postId];
}

class LoadFeeds extends PostEvent {
  const LoadFeeds();
}

class LoadProfilePosts extends PostEvent {
  final String userId;
  const LoadProfilePosts(this.userId);

  @override
  List<Object> get props => [userId];
}

class LoadPostComments extends PostEvent {
  final String postId;
  const LoadPostComments(this.postId);

  @override
  List<Object> get props => [postId];
}

class AddPostComment extends PostEvent {
  final String postId;
  final String commentContent;
  const AddPostComment(this.postId, this.commentContent);

  @override
  List<Object> get props => [postId, commentContent];
}

class LikedPost extends PostEvent {
  final String postId;
  const LikedPost(this.postId);

  @override
  List<Object> get props => [postId];
}

class UnlikedPost extends PostEvent {
  final String postId;
  const UnlikedPost(this.postId);

  @override
  List<Object> get props => [postId];
}