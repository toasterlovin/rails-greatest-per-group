require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  NEWEST_POSTS = {
    salinger: [ "Franny and Zooey", "1961-01-01" ],
    austen: [ "Persuasion", "1817-01-01" ],
    dickens: [ "Barnaby Rudge", "1841-01-01" ]
  }

  test "root redirects to authors" do
    get root_path
    assert_redirected_to "/authors"
  end

  test "index lists each author's newest post" do
    get authors_path
    assert_response :success
    assert_newest_posts with_dates: true
  end

  test "custom_query_methods lists each author's newest post title" do
    get custom_query_methods_authors_path
    assert_response :success
    assert_newest_posts with_dates: false
  end

  test "scoped_has_one lists each author's newest post" do
    get scoped_has_one_authors_path
    assert_response :success
    assert_newest_posts with_dates: true
  end

  test "view_backed_model lists each author's newest post" do
    get view_backed_model_authors_path
    assert_response :success
    assert_newest_posts with_dates: true
  end

  private
    def assert_newest_posts(with_dates:)
      NEWEST_POSTS.each do |author, (title, date)|
        assert_select "tr##{dom_id(authors(author))}" do
          assert_select "td", text: authors(author).full_name
          assert_select "td", text: title
          assert_select "td", text: date if with_dates
        end
      end
    end
end
