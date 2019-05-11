class LorePagesController < ApplicationController
  http_basic_authenticate_with name: "wolfgang", password: "baileyishot"
  before_action :set_lore_page, only: [:show, :edit, :update, :destroy]

  # GET /lore_pages
  # GET /lore_pages.json
  def index
    @lore_pages = LorePage.all
  end

  # GET /lore_pages/1
  # GET /lore_pages/1.json
  def show
  end

  # GET /lore_pages/new
  def new
    @lore_page = LorePage.new
  end

  # GET /lore_pages/1/edit
  def edit
  end

  # POST /lore_pages
  # POST /lore_pages.json
  def create
    @lore_page = LorePage.new(lore_page_params)

    respond_to do |format|
      if @lore_page.save
        format.html { redirect_to @lore_page, notice: 'Lore page was successfully created.' }
        format.json { render :show, status: :created, location: @lore_page }
      else
        format.html { render :new }
        format.json { render json: @lore_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lore_pages/1
  # PATCH/PUT /lore_pages/1.json
  def update
    respond_to do |format|
      if @lore_page.update(lore_page_params)
        format.html { redirect_to @lore_page, notice: 'Lore page was successfully updated.' }
        format.json { render :show, status: :ok, location: @lore_page }
      else
        format.html { render :edit }
        format.json { render json: @lore_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lore_pages/1
  # DELETE /lore_pages/1.json
  def destroy
    @lore_page.destroy
    respond_to do |format|
      format.html { redirect_to lore_pages_url, notice: 'Lore page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lore_page
      @lore_page = LorePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lore_page_params
      params.require(:lore_page).permit(:name, :slug, :body, :position)
    end
end
