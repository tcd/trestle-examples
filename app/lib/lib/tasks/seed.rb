module Lib
  module Tasks
    # Code for seeding the database.
    class Seed

      # @return [Pathname]
      def self.seeds_folder()
        return Rails.root.join("db", "seed_data")
      end

      # @return [Pathname]
      def self.fixtures_folder()
        return Rails.root.join("test", "fixtures")
      end

      # @return [Hash]
      def self.all()
        invalid = {}
        invalid["users"]       = self.users()
        invalid["video_games"] = self.video_games()
        return invalid
      end

      # ========================================================================
      # Seed Helpers
      # ========================================================================

      # @param file_name [String] Name of the TSV file with data to import.
      # @param model_class [Class] ActiveRecord model to create.
      #
      # @yieldparam [Hash] cells from one row of the file
      # @yieldreturn [Hash] arguments for creating the model instance from the row
      #
      # @return [Array<Hash>]
      def self.from_tsv(file_name, model_class)
        path = self.seeds_folder.join(file_name)
        rows = Lib::FlatFile::Tsv.from_file(path)
        pb = Lib::ProgressBar.new(rows.length, title: "seeding #{model_class.name} data")
        rows.each do |row|
          args = yield(row)
          args.compact!()
          model = model_class.new(args)
          model.save!()
          pb.increment()
        rescue StandardError => e
          pb.increment()
          pb.newline()
          pp(args)
          puts(e)
          pb.newline()
        end
        return nil
      end

      # @param file_name [String] Name of the TSV file with data to import.
      # @param model_class [Class] ActiveRecord model to create.
      #
      # @yieldparam [Hash] one fixture from the file
      # @yieldreturn [Hash] arguments for creating the model instance from the fixture
      #
      # @return [Array<Hash>]
      def self.from_fixture(file_name, model_class)
        path = self.fixtures_folder.join(file_name)
        yaml_data = ERB.new(path.read).result
        fixture_data = YAML.load(yaml_data)
        pb = Lib::ProgressBar.new(fixture_data.length, title: "seeding #{model_class.name} data")
        fixture_data.each do |fixture|
          fx = fixture[1]
          args = yield(fx)
          args.compact!()
          model = model_class.new(args)
          model.save!()
          pb.increment()
        rescue StandardError => e
          pb.increment()
          pb.newline()
          pp(args)
          puts(e)
          pb.newline()
        end
        return nil
      end

      # ========================================================================
      # Actual Seeds
      # ========================================================================

      # @return [void]
      def self.users()
        self.from_fixture("users.yml", User) do |fx|
          _args = {
            email:               fx["email"],
            first_name:          fx["first_name"],
            last_name:           fx["last_name"],
            profile_picture_url: fx["profile_picture_url"],
            password_digest:     fx["password_digest"],
          }
        end
        return nil
      end

      # @return [void]
      def self.video_games()
        self.from_fixture("video_games.yml", VideoGame) do |fx|
          _args = {
            full_name:    fx["full_name"],
            short_name:   fx["short_name"],
            release_date: fx["release_date"],
          }
        end
        return nil
      end

    end
  end
end
