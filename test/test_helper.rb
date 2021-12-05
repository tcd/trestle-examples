ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures(:all)

  # @raise [ArgumentError] unless `want` is Numeric
  # @raise [Lib::Errors::TestError] unless both `@initial_count` and `@model` are defined
  # @param want [Numeric] Expected
  # @param message [String]
  def assert_count_created(want, message = nil)
    raise ArgumentError unless want.is_a?(Numeric)
    raise Lib::Errors::TestError, "'@initial_count` must be defined to use `assert_count_created`" if @initial_count.nil?()
    raise Lib::Errors::TestError, "'@model` must be defined to use `assert_count_created`" if @model.nil?()
    assert_equal(
      (@initial_count + want),
      @model.count(),
      message,
    )
  end

end
