import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vertex/Post/repository/PostRepository.dart';
import 'package:vertex/Post/view/Postcard.dart';

import '../models/comment.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<LoadAllPosts>(_onLoadAllPosts);
    on<AddUserPost>(_onAddUserPost);
    on<DeleteUserPost>(_onDeleteUserPost);
    on<LoadFeeds>(_onLoadFeeds);

    // on<LoadProfilePosts>(_onLoadProfilePosts);
  }
  Future<void> _onLoadAllPosts(
      LoadAllPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.getAllPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to load posts: $e'));
    }
  }

    Future<void> _onAddUserPost(AddUserPost event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      await postRepository.addUserPost(event.postContent);
      final updatedPosts = await postRepository.getAllPosts();
      emit(PostLoaded(updatedPosts));
    } catch (e) {
      emit(PostError('Failed to add post: $e'));
    }
  }

  Future<void> _onDeleteUserPost(DeleteUserPost event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      await postRepository.deleteUserPost(event.postId);
      final updatedPosts = await postRepository.getAllPosts();
      emit(PostLoaded(updatedPosts));
    } catch (e) {
      emit(PostError('Failed to delete post: $e'));
    }
  }

  Future<void> _onLoadFeeds(LoadFeeds event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final feeds = await postRepository.getFeeds();
      emit(FeedPostLoaded(feeds));
    } catch (e) {
      emit(PostError('Failed to load feeds: $e'));
    }
  }

  // Future<void> _onLoadProfilePosts(LoadProfilePosts event, Emitter<PostState> emit) async {
  //   emit(PostLoading());
  //   try {
  //     final profilePosts = await postRepository.getProfilePosts(event.userId);
  //     emit(PostLoaded(profilePosts));
  //   } catch (e) {
  //     emit(PostError('Failed to load profile posts: $e'));
  //   }
  // }
}




