//post repository

import 'package:vertex/Post/view/Postcard.dart';
import 'package:vertex/Post/models/comment.dart';



abstract class PostRepository {
  Future<List<String>> getAllPosts();
  Future<void> addUserPost(Post post);
  Future<void> deleteUserPost(String postId);
  Future<List<Post>> getFeeds();
  Future<List<Post>> getProfilePosts(String userId);
  Future<List<Comment>> getPostComments(String postId);
  Future<void> addPostComment(String postId, String commentContent);
  Future<void> likePost(String postId);
  Future<void> unlikePost(String postId);
}


//post repository implementation
class PostRepositoryImpl extends PostRepository {
  
  PostRepositoryImpl();

  @override
  Future<List<String>> getAllPosts() async {
    return getAllPosts();
  }

  @override
  Future<void> addUserPost(Post postContent) async {
    return addUserPost(postContent);
  }

  @override
  Future<void> deleteUserPost(String postId) async {
    return deleteUserPost(postId);
  }

  @override
  Future<List<Post>> getFeeds() async {
    return getFeeds();
  }

  @override
  Future<List<Post>> getProfilePosts(String userId) async {
    return getProfilePosts(userId);
  }




  @override
  Future<List<Comment>> getPostComments(String postId) async {
    return getPostComments(postId);
  }

  @override
  Future<void> addPostComment(String postId, String commentContent) async {
    return addPostComment(postId, commentContent);
  }

  @override
  Future<void> likePost(String postId) async {
    return likePost(postId);
  }

  @override
  Future<void> unlikePost(String postId) async {
    return unlikePost(postId);
  }
}
