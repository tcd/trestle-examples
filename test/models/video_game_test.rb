require "test_helper"

module Tests
  module Models
    class VideoGameTest < ActiveSupport::TestCase

      setup do
        @model         = VideoGame
        @initial_count = @model.count()
      end

      test "that there are fixtures" do
        assert(@initial_count > 0)
      end

      test ".title" do
        assert_equal(@model.title(), "Video Games")
      end

      test ".icon_css_class" do
        refute_nil(@model.icon_css_class)
      end

      test "#display_name" do
        entity = @model.first()
        refute_nil(entity.display_name)
      end

    end
  end
end
