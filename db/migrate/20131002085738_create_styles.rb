class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    
    
    # populate table 
    Beer.all.each do |b|
		Style.create name: b.style
	end
  end
end
