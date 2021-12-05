class VideoGame < ApplicationRecord

  # =====================================================================
  # Attributes
  # =====================================================================

  # @!group Attributes

  # @!attribute short_name
  #   @return [String]
  validates("short_name", uniqueness: true, allow_nil: true)

  # @!attribute full_name
  #   @return [String]
  validates("full_name", presence: true, uniqueness: true)

  # @!attribute release_date
  #   @return [Date]

  # @!endgroup Attributes

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @return [String]
  def self.icon_css_class()
    return "fas fa-gamepad"
  end

  # =====================================================================
  # Instance Methods
  # =====================================================================

  # @return [String]
  def display_name()
    return self.short_name unless self.short_name.blank?()
    return self.full_name
  end

end
