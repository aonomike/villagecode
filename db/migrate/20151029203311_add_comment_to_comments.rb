class AddCommentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment, :text
    add_column :comments, :a_reply_to, :integer
  end
end
