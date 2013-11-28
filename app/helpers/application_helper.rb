module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-success"
		when :error
			"alert-danger"
		when :success
			"alert-success"
		else
			""
		end
	end
end
