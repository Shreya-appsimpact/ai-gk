class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :download_pdf_based_category]

  def index
    @categories = Category.all
  end

  def show
    if params[:value].present? 
      respond_to do |format|
        if params[:value] == "All"
          @questions = @category.questions.order(created_at: :desc)
          format.js
        else
          @questions = @category.questions.order(created_at: :desc).limit(params[:value].to_i)
          format.js
        end
      end
    else
      @questions = @category.questions.order(created_at: :desc).limit(10)
    end  
    @categories = Category.all
  end
  
  def download_pdf_based_category
    @questions = @category.questions.all  
    html = render_to_string(:action => '../questions/download_pdf', :layout => false, disposition: "inline")
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end