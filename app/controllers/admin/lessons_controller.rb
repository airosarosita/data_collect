class Admin::LessonsController < ApplicationController
  # Other actions ...

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  #GET /lesson/edit
  def edit
    @lesson = Lesson.find
  end
  

    # GET /lessons
    def index
      @lessons = Lesson.all
    end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admin_lessons_path, notice: "Lesson successfully created."
    else
      render :new 
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
  
end
