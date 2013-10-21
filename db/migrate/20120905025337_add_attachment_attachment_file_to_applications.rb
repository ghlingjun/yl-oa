class AddAttachmentAttachmentFileToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.has_attached_file :attachment_file
    end
  end

  def self.down
    drop_attached_file :applications, :attachment_file
  end
end
