class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = @campaign.todos.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @comments = @todo.comments
  end

  # GET /todos/new
  def new
    @todo = @campaign.todos.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = @campaign.todos.new(todo_params.merge(creator_id: current_user.id))

    respond_to do |format|
      if @todo.save
        format.html { redirect_to [@campaign, @todo], notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
        format.js
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [@campaign, @todo], notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to campaign_todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = @campaign.todos.find(params[:id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title)
    end
end
