module ApplicationHelper
  def image_path_for(user)
    if user.linkedin_picture_url.present?
      user.linkedin_picture_url
    elsif user.facebook_picture_url.present?
      user.facebook_picture_url
    elsif user.photo.present?
      cl_image_path user.photo.path
    else
      image_path "chien.jpg"
    end
  end

  def destinator_for(conversation)
    (conversation.recipients - [current_user]).first
  end
end
