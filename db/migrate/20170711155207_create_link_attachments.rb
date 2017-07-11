class CreateLinkAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :link_attachments do |t|
      t.references :link, foreign_key: true
      t.references :attachment, foreign_key: true
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
