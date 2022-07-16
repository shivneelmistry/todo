module Queries
    class FetchTasks < Queries::BaseQuery
  
      type [Types::TaskType], null: false
  
      def resolve
        Task.all.order(created_at: :desc)
      end
    end
end