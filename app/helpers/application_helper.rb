module ApplicationHelper

	def show_page_buttons(edit_path, destroy_path = false, list_path = false)
		links = []
		
		if current_user
			links << link_to('Edit', edit_path, class: 'btn btn-warning')
			links << link_to('Destroy', destroy_path, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger')  if destroy_path
		end
		
		links << link_to('List', list_path, class: 'btn') if list_path
		
		return links.join('').html_safe
	end
	
	
	def round(param)
		number_with_precision(param, precision: 1)
	end
end
