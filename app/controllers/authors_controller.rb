class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def custom_query_methods
    @authors = Author
      .select("authors.*, newest_posts.title AS newest_post_title")
      .joins("LEFT JOIN (SELECT DISTINCT ON (author_id) *
                         FROM posts
                         ORDER BY author_id, created_at DESC)
              AS newest_posts ON newest_posts.author_id = authors.id")
  end

  def scoped_has_one
    @authors = Author.includes(:scoped_has_one_newest_post)
  end

  def view_backed_model
    @authors = Author.includes(:view_backed_model_newest_post)
  end
end
