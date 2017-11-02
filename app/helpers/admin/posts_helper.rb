module Admin
  module PostsHelper
    class << self
      def render_states(view)
        view.sanitize(
          Post.statuses.keys.map do |status|
            view.content_tag :li do
              view.link_to status, '#'
            end
          end.join
        )
      end
    end
  end 
end
