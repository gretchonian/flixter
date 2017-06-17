class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_to_view_current_lesson

  def show
    
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_enrolled_to_view_current_lesson
    if ! current_user.enrolled_in?(current_lesson.section.course)
       redirect_to course_path(current_lesson.section.course)
       flash[:alert]= "You must enroll to view this lesson."
    # else
    #   redirect_to lesson_path(current_lesson.section.course)
    end
  end
  
end
