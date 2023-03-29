class StudentsController < ApplicationController
    skip_before_action :authorized, only: [:create]


    def login
        student =  Student.find_by(admission_number: login_student_params[:admission_number])
        if student
            if student.authenticate(password: login_student_params[:password])
                session[:student_id] = student.id
                return render json: client, status: :created
            end
        end
        render json: { error: "Invalid admission number or password" }, status: :not_found
    end

    def signup

    end

    def logged_in
        student = Student.find(session[:student_id])
        render json: student
    end

    private

    def login_student_params
        params.permit(:admission_number, :password)
    end

    def signup_student_params
        params.permit(:name, : :admission_number, :email, :id_number, :gender, :course_id, :fee_paid, :password_digest)
    end



end
