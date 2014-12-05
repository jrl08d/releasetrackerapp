class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @search = Issue.search(params[:q])
    @customers = Customer.order('name ASC')
    if params[:customer_filter].present?
        @customer = Customer.find(params[:customer_filter]) 
        @search = @customer.issues.search(params[:q])
        @issues = @search.result.paginate(:page => params[:page], :per_page => 12)
      else
        @search = Issue.search(params[:q])
        @issues = @search.result.paginate(:page => params[:page], :per_page => 12)
      end
    @releases = Release.all
    authorize! :read, @issue
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @comment = Comment.new
    @user = current_user
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    authorize! :create, @issue
    @issue.users.build
  end

  # GET /issues/1/edit
  def edit
    authorize! :update, @issue
    @comment = @issue.comments.build
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to :back, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize! :destroy, @issue
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :reported_date, :software_version, :reporter_name, :severity, :title, :github_issue_number_reference, :customer_id, :status, :user_id)
    end
end
