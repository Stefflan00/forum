class NotificationMailer < ApplicationMailer
  default from: "notifications@datalove.io"

  def forum_post_notification(user, forum_post)
    @forum_post = forum_post
    @user = user

    mail(
    to: "#{user.email}",
    subject: "[DataLove] New post in #{forum_post.forum_thread.subject}"
    )
  end
end
