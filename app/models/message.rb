class Message < ApplicationRecord
  belongs_to :destinator, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  validates :content, presence: true

  def name
    return "You should add method :name in your Messageable model"
  end

  def mailboxer_email(object)
  #Check if an email should be sent for that object
    if true
      return "define_email@on_your.model"
    else
      return nil
    end
  end
end
