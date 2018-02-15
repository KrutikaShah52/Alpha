class AlphaScaffoldsController < ApplicationController
  before_action :set_alpha_scaffold, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /alpha_scaffolds
  # GET /alpha_scaffolds.json
  def index
    @alpha_scaffolds = AlphaScaffold.paginate(page: params[:page], per_page: 3)
  end

  def home
    redirect_to alpha_scaffolds_path if logged_in?
  end

  # GET /alpha_scaffolds/1
  # GET /alpha_scaffolds/1.json
  def show 
    @alpha_scaffold = AlphaScaffold.find(params[:id])
  end

  # GET /alpha_scaffolds/new
  def new
    @alpha_scaffold = AlphaScaffold.new
  end

  # GET /alpha_scaffolds/1/edit
  def edit
    @alpha_scaffold = AlphaScaffold.find(params[:id])
  end

  # POST /alpha_scaffolds
  # POST /alpha_scaffolds.json
  
  def create
    @alpha_scaffold = AlphaScaffold.new(alpha_scaffold_params)
    # @alpha_scaffold.user = User.first
    @alpha_scaffold.user = current_user
    # puts "----------------#{@alpha_scaffold}"
    respond_to do |format|
      if @alpha_scaffold.save
        format.html { redirect_to @alpha_scaffold, notice: 'Articles was successfully created.' }
        format.json { render :show, status: :created, location: @alpha_scaffold }
      else
        format.html { render :new }
        format.json { render json: @alpha_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alpha_scaffolds/1
  # PATCH/PUT /alpha_scaffolds/1.json
  def update
    respond_to do |format|
      if @alpha_scaffold.update(alpha_scaffold_params)
        format.html { redirect_to @alpha_scaffold, notice: 'Alpha scaffold was successfully updated.' }
        format.json { render :show, status: :ok, location: @alpha_scaffold }
      else
        format.html { render :edit }
        format.json { render json: @alpha_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alpha_scaffolds/1
  # DELETE /alpha_scaffolds/1.json
  def destroy
    @alpha_scaffold.destroy
    respond_to do |format|
      format.html { redirect_to alpha_scaffolds_url, notice: 'Alpha scaffold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alpha_scaffold
      @alpha_scaffold = AlphaScaffold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alpha_scaffold_params
      params.require(:alpha_scaffold).permit(:title, :descreption)
    end

    def require_same_user
      if current_user != @alpha_scaffold.user
        flash[:danger] = "You can only delete and edit your own articles"
        redirect_to root_path
      end
    end
end
