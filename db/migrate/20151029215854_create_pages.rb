class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.integer :menu_order
      t.timestamps
    end

	Page.create(name: 'home',:menu_order => 0)
	Page.create(name: 'about',:menu_order =>1)
  Page.create(name: 'codeclub',:menu_order =>2)
	Page.create(name: 'tbc',:menu_order =>3)
	Page.create(name: 'make',:menu_order =>4)
	Page.create(name: 'volunteer',:menu_order =>5)
	Page.create(name: 'sponsor',:menu_order =>6)
	Page.create(name: 'blog',:menu_order =>7)
	Page.create(name: 'contact',:menu_order =>8)
	Page.create(name: 'users',:menu_order =>9)
  end
 
  def self.down
    drop_table :pages
  end
end