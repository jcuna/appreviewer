class UserFriendshipDecorator < Draper::Decorator
  delegate_all

  def friendship_state
  	model.state.titleize
  end
  def sub_message
  case model.state
    when 'pending'
    	"You have sent a friend request to #{model.friend.first_name}."
    when 'accepted'
      "You are friends with #{model.friend.first_name}."
    when 'requested'
      "Are you sure you want to be friends with #{model.friend.first_name}?"
    end
end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end