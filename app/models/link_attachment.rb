# == Schema Information
#
# Table name: link_attachments
#
#  id              :integer          not null, primary key
#  link_id         :integer
#  attachment_id   :integer
#  expiration_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class LinkAttachment < ApplicationRecord
  belongs_to :link
  belongs_to :attachment

  before_create :set_default

  def is_invalid?
    DateTime.now > self.expiration_date
  end

  private
    def set_default
      self.expiration_date = DateTime.now + 30.minutes
    end

end
