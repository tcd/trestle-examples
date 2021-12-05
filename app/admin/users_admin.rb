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

  # Customize the form fields shown on the new/edit views.
  #
  # form do |user|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:user).permit(:name, ...)
  # end
end
