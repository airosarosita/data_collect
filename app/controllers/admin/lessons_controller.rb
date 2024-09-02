class Admin::LessonsController < ApplicationController
  before_action :authenticate_user!
  # Other actions ...

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  def show
    @lesson = Lesson.find(params[:id])
    @contents = @lesson.contents
  end

  #GET /lesson/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  def content
    @lesson = Lesson.find(params[:id])
    # Add any additional logic needed for displaying the content
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to admin_lessons_path, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  def update
    @lesson = Lesson.find(params[:id])
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to admin_lesson_path(@lesson), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :context)
  end
  
end
