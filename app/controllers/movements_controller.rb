class MovementsController < ApplicationController
  before_action :set_movement, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /movements or /movements.json
  def index
    @movements = Movement.where(author_id: current_user.id)
  end

  # GET /movements/1 or /movements/1.json
  def show; end

  # GET /movements/new
  def new
    @movement = Movement.new
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

  def category_new
    @movement = Movement.new
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

  # GET /movements/1/edit
  def edit; end

  # POST /movements or /movements.json
  def create
    @movement = Movement.new(movement_params)

    @group = Group.find(params[:group_id]) if params[:group_id]

    respond_to do |format|
      if @movement.save
        if @group.nil?
          format.html { redirect_to movement_path(@movement), notice: 'Movement was successfully created.' }
        else
          format.html { redirect_to group_path(@group), notice: 'Movement was successfully created.' }
        end
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :category_new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: 'Movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def category_destroy
    @movement = Movement.find(params[:movement_id])

    @movement.destroy
    @group = Group.find(params[:group_id]) if params[:group_id]

    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movement
    @movement = Movement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movement_params
    hash = params.require(:movement).permit(:name, :amount, group_ids: [])
    hash[:author] = current_user
    hash
  end
end
