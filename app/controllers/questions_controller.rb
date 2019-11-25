class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:download_pdf]

  def index
    if params[:value].present? 
      respond_to do |format|
        if params[:value] == "All"
          @questions = Question.order(created_at: :desc)
          format.js
        else
          @questions = Question.order(created_at: :desc).limit(params[:value].to_i)
          format.js
        end
      end
    else
      @questions = Question.order(created_at: :desc).limit(10)
    end  
    @categories = Category.all
  end

  # def download_pdf
  #   params[:value] == "50"
  #   @questions = Question.all  
  #   html = render_to_string(:action => '../questions/download_pdf', :layout => false, disposition: "inline")
  #   pdf = PDFKit.new(html)
  #   send_data(pdf.to_pdf)                
  # end  

  def show
    @question = @category.questions.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit;  end
  
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :answer, :category_id)
    end
end
