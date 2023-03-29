class SessionsController < ApplicationController
    
    def create
        student = Student.find_by(admission_number: params.dig(:login, :admission_number))
        session[:student_id] = student.id
        render json: student
    end

    def destroy
        session.delete :student_id
        head :no_content
    end
end
