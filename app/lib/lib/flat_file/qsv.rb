module Lib
  module FlatFile
    # Read data exports from Postico
    module Qsv

      # https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-c-new
      #
      # @return [Hash]
      OPTIONS = {
        col_sep: ";",
        headers: true,
        quote_char: "'",
        converters: STANDARD_CSV::Converters.keys + [:json],
      }.freeze()

      # @param filepath [String] Path to the file.
      #
      # @return [Array<Hash{String => String}>]
      def self.from_file(filepath)
        # STANDARD_CSV::Converters[:json] = ->(s) { self.parse_postico_json(s) }
        return STANDARD_CSV.read(filepath, self.options).map(&:to_hash)
      end

      # @return [Hash]
      def self.options()
        custom_converter = ->(value, field_info) { self.parse_postico_json(value, field_info) }
        return {
          col_sep: ";",
          headers: true,
          quote_char: '"',
          converters: [custom_converter],
        }
      end

      # @param value [Object]
      # @param _field_info [Hash]
      #
      # @return [Object]
      def self.parse_postico_json(value, _field_info)
        return value if value.blank?()
        return value if value.length == 0
        return value unless value[0] == "{"
        return STANDARD_JSON.parse(value)
      rescue STANDARD_JSON::ParserError => e
        Rails.logger.error({
          message: "Rescued from 'JSON::ParserError' in parse_postico_json",
          error: e,
        })
        return value
      # rescue StandardError => e
      #   Rails.logger.error({
      #     message: "Rescued from 'StandardError' in parse_postico_json",
      #     error: e,
      #   })
      #   return value
      end

    end
  end
end
