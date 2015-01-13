# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  forum_thread_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ForumPost < ActiveRecord::Base

belongs_to :forum_thread
belongs_to :user

validates :body, presence: :true

  def send_notifications!
    # TODO: Get all the unique users from the thread of this post
    # thats possible through the has_many :users, through: forum_posts association
    users = forum_thread.users.uniq - [user]
    # TODO: Send an email to each of those users
    users.each do |user|
      NotificationMailer.forum_post_notification(user, self).deliver_later
    end
  end

end
