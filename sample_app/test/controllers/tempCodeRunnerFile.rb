hould get about" do
    get static_pages_about_url
    assert_response :success
  end