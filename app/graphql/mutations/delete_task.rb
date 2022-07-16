module Mutations
  class DeleteTask < BaseMutation
    field :id, ID, null: true
    argument :id, ID, required: true
    def resolve(id:)
      task = Task.find(id)
      task.destroy
    end
  end
end
