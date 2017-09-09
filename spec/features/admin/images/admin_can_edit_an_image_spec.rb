feature "An image exists" do
  context "an admin user logs in" do
    scenario "and edits an image" do
      user = User.create!(username: "Franklin", email: Faker::Internet.email, password: "1234", role: "admin")
      image = Image.create!(name: "cat1", url: "http://r.ddmcdn.com/s_f/o_1/cx_462/cy_245/cw_1349/ch_1349/w_720/APL/uploads/2015/06/caturday-shutterstock_149320799.jpg")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_image_path(image)
      expect(page).to have_content(image.name)

      click_on "edit image"

      fill_in 'image[name]', with: "Bill"
      click_on 'Update Image'

      expect(page).to have_content("Bill")

    end
  end
end
