import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var data = await ApiService.fetchPosts();
      posts.assignAll(data);
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }

  List<Post> get filteredPosts {
    if (searchQuery.isEmpty) {
      return posts;
    } else {
      return posts
          .where((post) =>
              post.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              post.body.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }
}
