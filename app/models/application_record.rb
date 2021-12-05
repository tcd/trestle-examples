# @abstract
#   Subclasses should override/implement the following methods:
#
#   - {.icon_css_class}
#   - {#display_name}
class ApplicationRecord < ActiveRecord::Base

  # Remove blank entries in array columns before validation.
  include Lib::Helpers::Stripper

  self.abstract_class = true

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @return [String]
  def self.icon_css_class()
    raise NotImplementedError
  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def display_name()
    return " " unless self.persisted?
    return self&.name || " "
  end

end
