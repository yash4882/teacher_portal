class StudentsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_id, only: %i[edit update destroy]
  def new
    @student = Student.new
  end

  def create
    @student = Student.find_or_initialize_by(name: params[:student][:name], subject: params[:student][:subject])
    @student.marks = params[:student][:marks].to_i  # This will replace the old marks with the new marks
    if @student.save
      redirect_to root_path, notice: 'Student saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to root_path, notice: 'Student updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to root_path, notice: 'Student deleted'
  end

  private
  def set_id
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
