module School
  class StudentsController < ApplicationController
    def index
      render plain: "Students"
    end
  end
end
