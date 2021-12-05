module Lib
  # Utility functions for use throughout the app.
  module Util

    # @param params [Array<Symbol>]
    # @return [Object]
    def self.get_credential(*params)
      return Rails.application.credentials.dig(Rails.env.to_sym, *params)
    end

  end
end
