require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  NEWEST_POST_TITLES = {
    "J.D. Salinger" => "Franny and Zooey",
    "Jane Austen" => "Persuasion",
    "Charles Dickens" => "Barnaby Rudge"
  }

  test "scoped has_one returns the newest post" do
    assert_equal posts(:three), authors(:salinger).scoped_has_one_newest_post
  end

  test "view backed has_one returns the newest post" do
    assert_equal posts(:three).id, authors(:salinger).view_backed_model_newest_post.id
  end

  test "scoped has_one can be preloaded without N+1 queries" do
    loaded = assert_queries_count(2) { Author.includes(:scoped_has_one_newest_post).to_a }

    assert_no_queries do
      assert_equal NEWEST_POST_TITLES, loaded.to_h { [ it.full_name, it.scoped_has_one_newest_post.title ] }
    end
  end

  test "view backed has_one can be preloaded without N+1 queries" do
    loaded = assert_queries_count(2) { Author.includes(:view_backed_model_newest_post).to_a }

    assert_no_queries do
      assert_equal NEWEST_POST_TITLES, loaded.to_h { [ it.full_name, it.view_backed_model_newest_post.title ] }
    end
  end
end
