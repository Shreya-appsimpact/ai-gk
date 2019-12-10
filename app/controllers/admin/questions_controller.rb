class Admin::QuestionsController < AdminController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    if params[:value].present? 
      respond_to do |format|
        if params[:value] == "All"
          @questions = question_order
          format.js
        else
          @questions = question_order.limit(params[:value].to_i)
          format.js
        end
      end
    else
      @questions = question_order.limit(10)
    end  
    @categories = Category.all
  end

  def import
    @category = Category.find(params[:category_id])
    if params[:file].present?
      if @category.name.downcase == params[:file].original_filename.downcase.split('.')[0]
        question = question_import
        unless question
          flash[:notice] = "Please check question. Question should be unique"
          redirect_to admin_category_path(@category) 
        else
          flash[:notice] = "Question are imported"
          redirect_to admin_category_path(@category)
        end
        @questions = question_import
      else      
        redirect_to admin_category_path(@category), notice: "Filename is wrong."
      end
    else
      redirect_to admin_category_path(@category), notice: "Filename is not present."   
    end    
  end

  def download_pdf
    @questions = Question.all  
    html = render_to_string(:action => '../questions/download_pdf', :layout => false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf)                
  end  

  def show;  end

  def new
    @question = Question.new
  end

  def edit;  end
  
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to admin_question_path(@question), notice: 'Question was successfully created.' }
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
        format.html { redirect_to admin_question_path(@question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def question_import
    Question.import(params[:file], params[:category_id]) 
  end
   
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to admin_questions_path, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def question_order
    Question.order(created_at: :desc)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :answer, :category_id)
    end
end
