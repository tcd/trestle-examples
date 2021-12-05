class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.string(:email, null: false, index: { unique: true })
      t.string(:password_digest)
      t.string(:first_name)
      t.string(:last_name)
      t.string(:profile_picture_url)
      t.timestamps()
    end
  end
end
