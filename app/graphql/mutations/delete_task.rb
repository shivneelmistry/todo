module Mutations
  class DeleteTask < BaseMutation
    field :id, ID, null: true
    argument :id, ID, required: true
    def resolve(id:)
      begin
        task = Task.find_by(id: id)
        unless task.nil?
          task.destroy
        end
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end

    end
  end
end
