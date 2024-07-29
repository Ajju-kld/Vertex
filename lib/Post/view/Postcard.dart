import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostCardSkeleton extends StatelessWidget {
  const PostCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info header skeleton
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Container(color: Colors.white),
              ),
              title: Container(
                width: 100,
                height: 16,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 150,
                height: 12,
                color: Colors.white,
              ),
            ),

            // Post image skeleton
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
            ),

            // Action buttons skeleton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Likes count skeleton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: 100,
                height: 16,
                color: Colors.white,
              ),
            ),

            // Caption skeleton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 200,
                    height: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            // Comments skeleton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: 150,
                height: 16,
                color: Colors.white,
              ),
            ),

            // Timestamp skeleton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                width: 80,
                height: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock Post data class
class Post {
  final String userAvatarUrl;
  final String username;
  final String location;
  final String imageUrl;
  final bool isLiked;
  final int likesCount;
  final String caption;
  final List<String> comments;
  final bool isSaved;
  final String timestamp;

  Post({
    required this.userAvatarUrl,
    required this.username,
    this.location = '',
    required this.imageUrl,
    this.isLiked = false,
    this.likesCount = 0,
    required this.caption,
    this.comments = const [],
    this.isSaved = false,
    required this.timestamp,
  });
}

class PostCard extends StatelessWidget {
  final Post post; // Declare a variable to hold the Post data

  const PostCard({
    Key? key,
    required this.post, // Constructor to initialize the Post data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
    
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.userAvatarUrl),
            ),
            title: Text(post.username),
            subtitle: Text(post.location ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options
              },
            ),
          ),

          // Post image
          Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),

          // Action buttons
          Row(
            children: [
              IconButton(
                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {
                  // Handle comment action
                },
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Handle share action
                },
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                ),
                onPressed: () {
                 
                },
              ),
            ],
          ),

          // Likes count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${post.likesCount} likes',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '${post.username} ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: post.caption),
                ],
              ),
            ),
          ),

          // Comments
          if (post.comments.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'View all ${post.comments.length} comments',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

          // Timestamp
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              post.timestamp,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}


