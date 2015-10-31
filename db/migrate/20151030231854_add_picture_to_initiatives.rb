class AddPictureToInitiatives < ActiveRecord::Migration
  def self.up
    add_attachment :initiatives, :picture
  end

  def self.down
    remove_attachment :initiatives, :picture
  end
end
