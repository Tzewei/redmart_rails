class ReviewsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

  end

  # GET /reviews/new
  def new
    @review = Review.new


  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id

    # @review = current_user.reviews.build(review_params)
    if @review.save!
      flash[:success] = "Review created!"
      redirect_to @product
    else
      render @product
    end
    # @review = Review.new(review_params)
    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_to @review, notice: 'Review was successfully created.' }
    #     # format.json { render :show, status: :created, location: @review }
    #   else
    #     format.html { render :new }
    #     # format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        # format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  # def destroy
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
  #     # format.json { head :no_content }
  #   end
  # end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_back(fallback_location: root_url)
  end



  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_review
    #   @review = Review.find(params[:id])
    # end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:userreview)
    end

end
