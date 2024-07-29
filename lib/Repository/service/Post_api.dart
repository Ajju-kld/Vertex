import 'dart:convert';
import 'dart:io';


import 'package:vertex/Post/models/comment.dart';
import 'package:vertex/Post/repository/PostException.dart';
import 'package:vertex/Post/view/Postcard.dart';
import 'package:vertex/Repository/service/api_base.dart';

final class PostApi extends ApiBase {
  final String baseUrl = 'https://143.244.141.7/post';
  PostApi(String baseUrl) : super(baseUrl); 

  Future<List<String>> getAllPosts() async {
    final response = await get('/');
    List<String> posts = [];
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      posts=jsonResponse['posts'];
    } else {
      throw PostsFetchFailedException('Failed to fetch posts');
    }
   return posts;
  }

  Future<void> addUserPost({required String caption,required String createdAt,required File post}) async {
   final response = await postFormData('/', {
      'caption': caption,
      'createdAt': createdAt,
    },fileField: 'post',file: post);
    if (response.statusCode != 201) {
      throw PostCreationFailedException('Failed to create post');
    } 

    
   
  }

  Future<void> deleteUserPost(String postId) async {
    await delete('posts/$postId');
  }

  Future<List<Post>> getFeeds() async {
    final response = await get('/feeds');
    if (response.statusCode == 200) {
      final resjson = json.decode(response.body);
      final List<Post> posts = resjson['posts']
          .map<Post>((post) => Post(
                userAvatarUrl: post['userAvatarUrl'],
                username: post['username'],
                location: post['location'],
                imageUrl: post['imageUrl'],
                isLiked: post['isLiked'],
                likesCount: post['likesCount'],
                caption: post['caption'],
                comments: post['comments'],
                timestamp: post['timestamp'],
              ))
          .toList();
      return posts;
    } else {
      throw PostsFetchFailedException('Failed to fetch posts');
    }
  }

  Future<List<Post>> getProfilePosts(String userId) async {
    final response = await get('profile/$userId/posts');
    if (response.statusCode == 200) {
      final resjson = json.decode(response.body);
      final List<Post> posts = resjson['posts']
          .map<Post>((post) => Post(
                userAvatarUrl: post['userAvatarUrl'],
                username: post['username'],
                location: post['location'],
                imageUrl: post['imageUrl'],
                isLiked: post['isLiked'],
                likesCount: post['likesCount'],
                caption: post['caption'],
                comments: post['comments'],
                timestamp: post['timestamp'],
              ))
          .toList();
      return posts;
    } else {
      throw PostsFetchFailedException('Failed to fetch posts');
    }
  }

  Future<List<Comment>> getPostComments(String postId) async {
    final response = await get('posts/$postId/comments');
    
    if (response.statusCode == 200) {
      final resjson = json.decode(response.body);
      final List<Comment> comments = resjson['comments']
          .map<Comment>((comment) => Comment(
                id: comment['id'],
                userProfileUrl: comment['userProfileUrl'],
                username: comment['username'],
                comment: comment['comment'],
                createdAt: comment['timestamp'],
                postId: comment['postId'],
                numberOfLikes: comment['numberOfLikes'],
                isLiked: comment['isLiked'],
              ))
          .toList();
      return comments;
    } else {
      throw CommentsFetchFailedException(postId, 'Failed to fetch comments');
    }
  }

  Future<void> addPostComment(String postId, String commentContent) async {
    

    final response= await post('posts/$postId/comments', body: {
      'post': postId,
       'comment': commentContent,
       'createdAt': DateTime.now().toIso8601String(),
    });
    if (response.statusCode != 201) {
      throw CommentCreationFailedException(postId, 'Failed to create comment');
    }
  


  }

  Future<void> likePost(String postId) async {
    await post('posts/$postId/like');
  }

  Future<void> unlikePost(String postId) async {
    await delete('posts/$postId/like');
  }
}