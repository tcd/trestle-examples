Trestle.resource(:users) do

  menu do
    item(:users, icon: @admin.model.icon_css_class)
  end

  table(autolink: true) do
    column(:profile_picture, header: nil, sort: false, align: :center) do |user|
      avatar(fallback: user.initials) { image_tag(user.avatar_url) }
    end
    column(:display_name, header: "Name", sort: false)
    column(:email)
    column(:created_at, align: :center)
    column(:updated_at, align: :center)
  end

  # @param user [User]
  form do |user|

    row do
      col(sm: 6) { text_field(:email) }
    end

    row do
      col(sm: 3) { text_field(:first_name) }
      col(sm: 3) { text_field(:last_name) }
    end

    row do
      col(sm: 6) { text_field(:profile_picture_url) }
    end

  end

  params do |params|
    params.require(:user)
          .permit(
            :email,
            :first_name,
            :last_name,
            :profile_picture_url,
            # :password,
            # :password_confirmation,
          )
  end
end
