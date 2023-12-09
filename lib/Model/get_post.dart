class GetPostModel {
  String? status;
  String? page;
  List<Categories>? categories;

  GetPostModel({this.status, this.page, this.categories});

  GetPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    page = json['page'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['page'] = this.page;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  bool? active;
  Data? data;

  Categories({this.categoryId, this.categoryName, this.active, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    active = json['active'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['active'] = this.active;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PostList>? postList;

  Data({this.postList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['post_list'] != null) {
      postList = <PostList>[];
      json['post_list'].forEach((v) {
        postList!.add(new PostList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.postList != null) {
      data['post_list'] = this.postList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostList {
  String? postId;
  String? postName;
  String? postDate;
  String? photo;

  PostList({this.postId, this.postName, this.postDate, this.photo});

  PostList.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postName = json['post_name'];
    postDate = json['post_date'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_name'] = this.postName;
    data['post_date'] = this.postDate;
    data['photo'] = this.photo;
    return data;
  }
}