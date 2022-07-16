module Types
  class MutationType < Types::BaseObject
    field :add_task, mutation: Mutations::AddTask
    field :delete_task, mutation: Mutations::DeleteTask
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
