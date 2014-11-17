class DeploymentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_deployment, only: [:show, :edit, :update, :destroy]

  # GET /deployments
  # GET /deployments.json
  def index
     @customers = Customer.order('name ASC')
    if params[:customer_id]
      @search = Deployment.search(params[:q])
      @customer = Customer.find(params[:customer_id]).paginate(:page => params[:page], :per_page => 12)
      @deployments = @customer.deployments.all
    else
      @search = Deployment.search(params[:q])
      @deployments = @search.result.includes(:customer).includes(:release).paginate(:page => params[:page], :per_page => 12)
    end
    respond_to do |format|
      format.html
      format.csv { render text: @deployments.to_csv }
    end
  end

  # GET /deployments/1
  # GET /deployments/1.json
  def show
  end

  # GET /deployments/new
  def new
    @deployment = Deployment.new
  end

  # GET /deployments/1/edit
  def edit
    
  end

  # POST /deployments
  # POST /deployments.json
  def create
    @deployment = Deployment.new(deployment_params)
    @customer = @deployment.customer

    respond_to do |format|
      if @deployment.save
        format.html { redirect_to deployments_path, notice: 'Deployment was successfully created.' }
        format.json { render :show, status: :created, location: @deployment }
      else
        format.html { render :new }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deployments/1
  # PATCH/PUT /deployments/1.json
  def update
    respond_to do |format|
      if @deployment.update(deployment_params)
        format.html { redirect_to @deployment, notice: 'Deployment was successfully updated.' }
        format.json { render :show, status: :ok, location: @deployment }
      else
        format.html { render :edit }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deployments/1
  # DELETE /deployments/1.json
  def destroy
    @customer = @deployment.customer
    @deployment.destroy
    respond_to do |format|
      format.html { redirect_to deployments_url, notice: 'Deployment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      params[:sort] || "deploy_date"
    end
  
    def sort_direction
      params[:direction] || "desc"
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_deployment
      @deployment = Deployment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deployment_params
      params.require(:deployment).permit(:deploy_date, :customer_id, :release_id, :version)
    end
end
