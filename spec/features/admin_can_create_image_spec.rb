feature "Admin is logged in" do
  context "and visits new image page" do
    scenario "and creates a new image" do
      image = 'https://pbs.twimg.com/profile_images/530292596740866048/nR0ZmD3x.jpeg'
      admin = User.create!(username: "Franklin", email: Faker::Internet.email, password: "1234", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path

      fill_in 'image[url]', with: image

      click_on "Create Image"
save_and_open_page
      expect(page).to have_content(image)
    end
  end
end
