class GoalsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user

  # GET /goals
  # GET /goals.json
  def index
    @goal = Goal.where(user_id:current_user).first
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    unless User.current.id ==Goal.find(params[:id]).user_id || !Goal.exists?(:user_id =>User.current.id) || !Goal.exists?(:id =>params[:id])
      redirect_to goals_path, :alert =>'You are not authorize to access this resource'
    end  
  end

  # GET /goals/new
  def new
    @goals = Goal.all
    @goalexists = Goal.exists?(:user_id =>User.current.id)
    if @goals.length <= 0 || !@goalexists
      @goal = Goal.new
    else
      redirect_to goals_path, :alert =>'You have already set a goal'
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
    unless User.current.id == @goal.user_id
      redirect_to goals_path, :alert =>'You are not authorize to access this resource'
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id]) rescue not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:idealWeight)
    end
end
