class CreatePostTags < ActiveRecord::Migration
	def change
	    create_table :post_tags do |t|
		  t.column :tag, :string
		  t.references :post
  		  t.timestamps
	    end
	end
end