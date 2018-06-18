module ApplicationHelper

	# Returns the full title on a per-page basis
	def full_title(page_title = '')
		base_title = "Slogan of website"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
	# Creates simple meta tags
	def meta_tag(name, content)
		tag(:meta, name: name, content: content)
	end
end
