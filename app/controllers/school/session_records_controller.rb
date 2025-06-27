module School
  class SessionRecordsController < ApplicationController
    before_action :set_session_detail
    before_action :set_session_record, only: [:destroy]

    def create
      @session_record = @session_detail.session_records.new(session_record_params)
      # Debug the parameters coming in
      logger.debug "🔍 Session Record Params: #{session_record_params.inspect}"
      logger.debug "🔍 Start Time before save: #{@session_record.start_time.inspect}"

      respond_to do |format|
        if @session_record.save
          logger.debug "🔍 Start Time after save: #{@session_record.start_time.inspect}"
          format.turbo_stream
          format.html { redirect_to edit_session_detail_path(@session_detail), notice: "Session record was successfully created." }
        else
          logger.debug "❌ Session Record Errors: #{@session_record.errors.full_messages}"
          format.turbo_stream { render turbo_stream: turbo_stream.replace('new_session_record', partial: 'school/session_records/form', locals: { session_record: @session_record }) }
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @session_record.destroy

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to edit_session_detail_path(@session_detail), notice: "Session record was successfully deleted." }
      end
    end

    private

    def set_session_detail
      @session_detail = SessionDetail.find(params[:session_detail_id])
    end

    def set_session_record
      @session_record = @session_detail.session_records.find(params[:id])
    end

    def session_record_params
      params.require(:session_record).permit(:start_time, :duration)
    end
  end
end
