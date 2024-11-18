class Admin::TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @lesson = @test.lesson  # Corrected this line to use Lesson.find
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    # Attach files if provided
    attach_files

    if @test.save
      redirect_to admin_tests_path, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      # Attach files if provided
      attach_files

      redirect_to admin_tests_path, notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_url, notice: 'Test was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :description, :image) # You can add additional fields here if necessary
  end

  def attach_files
    # Attach photo, audio, and video if they are present
    if params[:test][:photo].present?
      @test.photo.attach(params[:test][:photo])
    end

    if params[:test][:audio].present?
      @test.audio.attach(params[:test][:audio])
    end

    if params[:test][:video].present?
      @test.video.attach(params[:test][:video])
    end
  end
end
