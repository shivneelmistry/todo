module Types
    module Input
      class NoteInputType < Types::BaseInputObject
        argument :title, String, required: true
        argument :body, String, required: true
        argument :completed, Boolean, default: false
      end
    end
end