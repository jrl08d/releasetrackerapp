class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :clear_search_index, :only => [:index]
  helper_method :sort_column, :sort_direction


  # GET /customers
  # GET /customers.json
  def index
    if current_user.admin?
      if request.format == "csv"
        @customers = Customer.order("name ASC")
        respond_to do |format|
          format.html
          format.json
          format.csv { render :csv => @customers}
        end
        Resque.enqueue(CSVExportJob)
      else
        @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
        @deployments = Deployment.order("created_at DESC").limit(1)
      end
    else
      @customer = current_user.customers.first
      @deployments = @customer.try(:deployments)
      Resque.enqueue(CSVExportJob)
      respond_to do |format|
        format.html {redirect_to deployments_path}
      end
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    authorize! :update, @customer
    authorize! :read, @customer
    @customer.users.build if @customer.users.none?
    get_customer_data
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    authorize! :create, @customer
    @customer.users.build
  end

  # GET /customers/1/edit
  def edit
    authorize! :update, @customer
    @customer.users.build if @customer.users.none?
    get_customer_data
  end

  # POST /customers
  # POST /customers.json
  def create

    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    if @customer.update(customer_params)
      notice = 'Customer was successfully updated.'
      if @customer.new_record?
        redirect_to customers_url, notice: notice
      else
        flash.now[:notice] = notice
        get_customer_data
        render :edit
      end
    else
      get_customer_data unless @customer.new_record?
      render :edit
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize! :destroy, @customer
  end

  private

    def sort_column
      Customer.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, users_attributes: [
        :id,
        :username,
        :email,
        :password,
        :password_confirmation
      ])
    end

    def get_customer_data
      @deployment = @customer.deployments.build
      @issue = @customer.issues.build
      @search = @customer.issues.search(params[:q])
      @issues = @search.result.paginate(:page => params[:page], :per_page => 12)
    end

end
