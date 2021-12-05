Trestle.resource(:video_games) do

  menu do
    item(@admin.model.title(), icon: @admin.model.icon_css_class())
  end

  active_storage_fields do
    [:box_art]
  end

  table do
    column(:box_art, sort: :has_box_art, header: "Box Art", align: :center) do |x|
      if x.box_art.attached?()
        image_tag(main_app.url_for(x.box_art), style: "max-height: 150px;")
      end
    end
    column(:short_name, sort: :sort_by_short_name, header: "Short Name")
    column(:full_name, sort: :sort_by_full_name, header: "Full Name", truncate: false)
    column(:release_date, header: "Release Date", align: :center)
    # column(:created_at, align: :center)
    # column(:updated_at, align: :center)
  end

  # @param user [VideoGame]
  form do |video_game|

    sidebar do
      row(class: "text-center") do
        col { content_tag(:h1) { video_game.display_name } }
      end
      row(class: "text-center") do
        col do
          active_storage_field(:box_art, label: false)
        end
      end
    end

    tab(:video_game) do
      row do
        col(sm: 3) { text_field(:full_name)  }
        col(sm: 3) { text_field(:short_name) }
      end

      row do
        col(sm: 6) { date_field(:release_date) }
      end
    end

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

  sort_column :has_box_art do |collection, order|
    case order
    when :asc  then collection.sort_by { |s| s.box_art_attachment ? 1 : 0 }
    when :desc then collection.sort_by { |s| s.box_art_attachment ? 0 : 1 }
    else            collection
    end
  end

end
