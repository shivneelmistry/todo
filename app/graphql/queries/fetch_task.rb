module Queries
    class FetchTask < Queries::BaseQuery
      type Types::TaskType, null: false
      argument :id, ID, required: true
  
      def resolve(id:)
        Task.find(id)
    rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Task does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
end