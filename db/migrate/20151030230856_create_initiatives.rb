class CreateInitiatives < ActiveRecord::Migration
  def self.up
    create_table :initiatives do |t|
      t.string :initiative_name
      t.string :initiative_desc
      t.string :initiative_category
      t.string :initiative_features
      t.string :slug
      t.string :sans_html_name
      t.timestamps
    end

    Initiative.create(initiative_name: 'Group<br/>training',sans_html_name: 'Group training',initiative_desc: 'Training in a positively charged environment, we work together to achieve our own goals. Groups are made up of 10 - 15 people and cater to all ability levels.',initiative_category: 'codeclub',initiative_features: '[[Come to any initiative][Multi-initiative discounts][Train with friends]]')
    Initiative.create(initiative_name: 'Individual<br/>training',sans_html_name: 'Individual training',initiative_desc: 'Perfect for those who need a little extra motivation.You\'ll receive a fully personalized training program that we\'ll monitor together. .',initiative_category: 'codeclub',initiative_features: '[[Flexible booking times][Personal Advice][Multi-initiative discounts][Weekly progress tracking]]')
    Initiative.create(initiative_name: 'Cool<br/>Projects',sans_html_name: 'cool projects',initiative_desc: 'Showcase your projects in a positively charged environment, to achieve our own goals. Groups are made up of 10 - 15 people and cater to all ability levels. ',initiative_category: 'make',initiative_features: '[[Come to any initiative][Multi-initiative discounts][Train with friends]]')
    Initiative.create(initiative_name: 'Mecha<br/>Mind',sans_html_name: 'Mecha Mind',initiative_desc: 'Perfect for those who need to get their feet wet. Make cool projects with the Raspberry Pi that we\'ll monitor together. ',initiative_category: 'make',initiative_features: '[[Flexible booking times][Personal Advice][Multi-initiative discounts][Weekly progress tracking]]')
 
 end
 
  def self.down
    drop_table :initiatives
  end
end