class Admin::ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :set_lesson, only: %i[ new create]


  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    
  end
  
  # GET /contents/new
  def new
    @content = @lesson.contents.build
    @all_contents = Content.all
  end

  # POST /contents or /contents.json
  def create
    @content = @lesson.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to admin_lesson_path(@content.lesson), notice: "Content was successfully created." }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to admin_contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to admin_content_url(@content), notice: "Content was successfully updated." }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def content_params
    params.require(:content).permit(:title, :content)
  end
end