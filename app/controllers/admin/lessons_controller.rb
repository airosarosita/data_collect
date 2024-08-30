class Admin::LessonsController < ApplicationController
  before_action :authenticate_user!
  # Other actions ...

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  def show

  end

  #GET /lesson/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  def content
    @lesson = Lesson.find(params[:id])
    # Add any additional logic needed for displaying the content
  end
  

    # GET /lessons
    def index
      @lessons = Lesson.all
    end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to admin_lessons_path, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
  
end
