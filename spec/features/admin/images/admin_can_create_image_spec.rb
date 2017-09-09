feature "Admin can create an image" do
  context "admin logs in" do
    scenario "and creates a new image" do
      image = 'https://pbs.twimg.com/profile_images/530292596740866048/nR0ZmD3x.jpeg'
      name = Faker::Hacker.ingverb
      admin = User.create!(username: "Franklin", email: Faker::Internet.email, password: "1234", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path

      fill_in 'image[name]', with: name
      fill_in 'image[url]', with: image

      click_on "Create Image"

      expect(page).to have_css("img[src*=image]")
      expect(page).to have_content(name)
    end
  end
  context "default user logs in" do
    scenario "and cannot get to the new image page" do
      user = User.create!(username: "Franklin", email: Faker::Internet.email, password: "1234")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_image_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
