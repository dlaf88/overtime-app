module ApplicationHelper
	def active?(path)
		return "active" if current_page?(path)
	end 

	def status_label(status)
		status_generator status
	end 

	private 
	def status_generator status
		case status
		when 'submitted'
			content_tag(:span,status.titleize,class: 'label label-primary')
		when 'approved'
			content_tag(:span,status.titleize,class: 'label label-success')
		when 'rejected'
			content_tag(:span,status.titleize,class: 'label label-danger')
		when 'pending'
			content_tag(:span,status.titleize,class: 'label label-primary')
		when 'confirmed'
			content_tag(:span,status.titleize,class: 'label label-success')
		end	

	end

end
