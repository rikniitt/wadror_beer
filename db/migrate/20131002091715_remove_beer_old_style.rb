class RemoveBeerOldStyle < ActiveRecord::Migration
  def change
	
	#handle beer style
	Beer.all.each do |b|
		style = Style.find_by_name b.old_style
		if not style.nil? and b.style_id.nil?
			style.beers << b
		end
	end
	
	remove_column :beers, :old_style
	
  end
end
