class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change()
    create_table(:video_games) do |t|
      t.string(:full_name, null: false, index: { unique: true })
      t.string(:short_name, index: { unique: true, where: "short_name IS NOT NULL" })
      t.datetime(:release_date)
      t.timestamps()
    end
  end
end
