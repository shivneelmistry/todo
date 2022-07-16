module Types
    module Input
      class TaskInputType < Types::BaseInputObject
        argument :title, String, required: true
        argument :body, String, required: true
        argument :completed, Boolean, required: false, default_value: false
      end
    end
end
