class User < ApplicationRecord

  # ============================================================================
  # Attributes
  # ============================================================================

  # @!group Attributes

  # @!attribute email
  #   @return [String]
  validates(:email, presence: true, uniqueness: true)

  # @!attribute first_name
  #   @return [String]

  # @!attribute last_name
  #   @return [String]

  # @!attribute profile_picture_url
  #   @return [String]

  # @!endgroup Attributes

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @return [String]
  def self.icon_css_class()
    return "fas fa-users"
  end

  # =====================================================================
  # Instance Methods
  # =====================================================================

  # @return [String]
  def display_name()
    return [
      self.first_name,
      self.last_name,
    ].uniq.join(" ")
  end

  # @return [String]
  def initials()
    return [
      self.first_name&.[](0),
      self.last_name&.[](0),
    ].reject(&:blank?).join("")
  end

  # @return [String]
  def avatar_url()
    return profile_picture_url unless profile_picture_url.blank?()
    hash = Digest::MD5.hexdigest(email)
    return "https://www.gravatar.com/avatar/#{hash}"
  end

end
