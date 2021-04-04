class User
  module Notifications
    class StudentRepliedToDiscussionNotification < Notification
      params :discussion_post

      # TODO
      def url
        "#"
      end

      def i18n_params
        {
          student_name: student.handle,
          track_title: solution.track.title,
          exercise_title: solution.exercise.title
        }
      end

      def image_type
        :avatar
      end

      def image_url
        student.avatar_url
      end

      def guard_params
        "DiscussionPost##{discussion_post.id}"
      end

      private
      def student
        solution.user
      end

      def solution
        discussion_post.solution
      end
    end
  end
end
