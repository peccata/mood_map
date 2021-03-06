  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Mood Map"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def sign_in(user)
    visit user_session_path
    fill_in "Nickname or email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
