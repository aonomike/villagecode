class CreatePosts < ActiveRecord::Migration
	def change
	    create_table :posts do |t|
		  t.column :post_status, :string
		  t.column :read_count, :string
		  t.column :post_title, :string
		  t.column :post_content, :text
		  t.column :slug, :string
		  t.column :by_line, :string
		  t.references :user
  		  t.timestamps
	    end

	    add_index :posts, :post_title
	    add_index :posts, :slug
	end
end