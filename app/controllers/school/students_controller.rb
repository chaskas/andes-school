module School
  class StudentsController < ApplicationController
    def index
      render plain: "Students#Index"
    end
  end
end
