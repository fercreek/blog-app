module Admin
  module PostsHelper
    class << self
      def render_states(view)
        view.sanitize(
          statuses(view).keys.map do |status, path|
            view.content_tag :li do
              view.link_to status, path
            end
          end.join
        )
      end

      private
      
      def statuses(view)
        # { 'all' => admin_posts_path, 
        # 'draft' => by_status_admin_posts_path('draft') }
        { 'all' => view.admin_posts_path }.merge(
          Post.statuses.keys.inject({}) do |hash, status| 
            hash.merge(status => view.by_status_admin_posts_path(status))
          end
        )
      end
    end
  end 
end
