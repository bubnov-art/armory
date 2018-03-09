module ApplicationHelper
	def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def header_login(user)
  	if user
  		links = []
  		links << header_link(link_to("#{user.username}'s account" , account_path, class: 'nav-link'))
  		links << header_link(link_to('Logout', destroy_user_session_path, method: :delete, class: 'nav-link'))
  		raw links.join
  	else
  		header_link link_to('Login', new_user_session_path, class: 'nav-link')
  	end
  end

  def header_link(link)
  	content_tag :li, class: 'nav-item', style: 'display: flex;' do
  		link
  	end
  end
end
