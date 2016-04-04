class Author < ActiveRecord::Base
  has_many :posts
  has_one :scoped_has_one_newest_post, -> {
    select("DISTINCT ON (author_id) *")
    .order(:author_id, created_at: :desc)
  }, class_name: "Post"

  def full_name
    "#{first_name} #{last_name}"
  end
end
