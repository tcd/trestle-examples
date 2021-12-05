Trestle.resource(:video_games) do

  menu do
    item(@admin.model.title(), icon: @admin.model.icon_css_class())
  end

  table do
    column(:display_name, sort: false)
    column(:short_name, sort: :sort_by_short_name)
    column(:full_name, sort: :sort_by_full_name, truncate: false)
    column(:release_date, align: :center)
    # column(:created_at, align: :center)
    # column(:updated_at, align: :center)
  end

  # @param user [VideoGame]
  form do |video_game|

    row do
      col(sm: 3) { text_field(:full_name)  }
      col(sm: 3) { text_field(:short_name) }
    end

    row do
      col(sm: 6) { date_field(:release_date) }
    end

  end

  params do |params|
    params.require(:video_game)
          .permit(
            :full_name,
            :short_name,
            :release_date,
          )
  end

  sort_column :sort_by_short_name do |collection, order|
    case order
    when :asc  then collection.order("short_name ASC NULLS LAST")
    when :desc then collection.order("short_name DESC NULLS LAST")
    else            collection
    end
  end

  sort_column :sort_by_full_name do |collection, order|
    case order
    when :asc  then collection.order("full_name ASC NULLS LAST")
    when :desc then collection.order("full_name DESC NULLS LAST")
    else            collection
    end
  end

end
