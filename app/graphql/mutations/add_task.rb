module Mutations
  class AddTask < Mutations::BaseMutation
    argument :params, Types::Input::TaskInputType, required: true
    field :task, Types::TaskType, null: false

    def resolve(params:)
      task_params = Hash params

      begin
        task = Task.create!(task_params)

        { task: task }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
