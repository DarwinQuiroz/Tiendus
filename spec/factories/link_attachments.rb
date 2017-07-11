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

FactoryGirl.define do
  factory :link_attachment do
    link nil
    expiration_date "2017-07-11 10:52:08"
  end
end
