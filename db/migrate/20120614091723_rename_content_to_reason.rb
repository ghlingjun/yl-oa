class RenameContentToReason < ActiveRecord::Migration
	def change
		rename_column :applications, :content, :reason
	end
end
