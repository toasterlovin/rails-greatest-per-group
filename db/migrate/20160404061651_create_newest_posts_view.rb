class CreateNewestPostsView < ActiveRecord::Migration
  def up
    execute <<-sql
      CREATE VIEW newest_posts AS
        SELECT DISTINCT ON (author_id) *
        FROM posts
        ORDER BY author_id, created_at DESC
    sql
  end

  def down
    execute <<-sql
      DROP VIEW newest_posts
    sql
  end
end
