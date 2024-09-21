class ApplicationController < ActionController::Base
    
    private

    def authenticate_teacher!
        redirect_to root_path, alert: "You must be logged in." unless teacher_signed_in?
    end

    def current_teacher
        Current.teacher ||= authenticate_teacher_from_session    
    end
    helper_method :current_teacher

    def authenticate_teacher_from_session
        Teacher.find_by(id: session[:teacher_id])
    end

    def teacher_signed_in?
        current_teacher.present?
    end
    helper_method :teacher_signed_in?

    def login(teacher)   #login method 
        Current.teacher = teacher
        reset_session
        session[:teacher_id] = teacher.id
    end

    def logout(teacher)  #logout method
        Current.teacher = nil
        reset_session
    end
end