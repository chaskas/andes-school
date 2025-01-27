module School
  class GroupsController < ApplicationController
    before_action :set_group, only: %i[show edit update destroy add_participant remove_participant]

    # GET /groups
    def index
      @groups = Group.all
    end

    # GET /groups/1
    def show; end

    # GET /groups/new
    def new
      @group = Group.new
    end

    # GET /groups/1/edit
    def edit
      @group = Group.find(params[:id])
      @participants = Participant.order(:name)
    end

    # POST /groups
    def create
      @group = Group.new(group_params)

      if @group.save
        redirect_to edit_group_path(@group), notice: 'Group was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /groups/1
    def update
      if @group.update(group_params)
        redirect_to @group, notice: 'Group was successfully updated.', status: :see_other
      else
        @participants = Participant.order(:name)
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /groups/1
    def destroy
      @group.destroy!
      redirect_to groups_url, notice: 'Group was successfully destroyed.', status: :see_other
    end

    def add_participant
      @group = Group.find(params[:id])
      participant = Participant.find(params[:participant_id])

      @group.participants << participant unless @group.participants.include?(participant)

      redirect_to edit_group_path(@group)
    end

    def remove_participant
      @group = Group.find(params[:id])
      participant = Participant.find_by(id: params[:participant_id])

      if participant.nil?
        redirect_to edit_group_path(@group)
      elsif @group.participants.delete(participant)
        redirect_to edit_group_path(@group)
      else
        redirect_to edit_group_path(@group)
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :description)
    end

  end
end
