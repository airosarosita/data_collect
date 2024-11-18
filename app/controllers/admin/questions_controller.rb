class Admin::QuestionsController < ApplicationController
    before_action :set_question, only: %i[show edit update destroy]
    before_action :set_test, only: [:new, :create, :edit, :update, :destroy]

    # GET /tests/:test_id/questions
    def index
      @questions = @test.questions.all
    end

    # GET /questions/:id
    def show
      # @question sudah di-set dengan before_action :set_question
    end

    # GET /tests/:test_id/questions/new
    def new
      @question = @test.questions.new
    end

    # GET /questions/:id/edit
    def edit
      # @question sudah di-set dengan before_action :set_question
    end

    # POST /tests/:test_id/questions
    def create
      @question = @test.questions.build(question_params)
      if @question.save
        redirect_to admin_test_path(@test), notice: "Question was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /questions/:id
    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@test), notice: "Question was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /questions/:id
    def destroy
      @question.destroy
      redirect_to admin_test_path(@test), notice: "Question was successfully destroyed."
    end

    private

    # Set @test for every action that needs it
    def set_test
      @test = Test.find_by(id: params[:test_id])
      redirect_to admin_tests_path, alert: 'Test not found' if @test.nil?
    end

    # Set @question for actions that need it (show, edit, update, destroy)
    def set_question
      @question = @test.questions.find(params[:id])
    end

    # Strong parameters to ensure only the allowed parameters are accepted
    def question_params
      params.require(:question).permit(:question, answers: [],)
    end
  end
