class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  before_filter :authenticate_user!
  before_filter :load_and_check_discussion_recipient, :only => [:new]
  
  def index
    @profile = current_user.profile
    if current_user.discussions.any?
      @discussions = current_user.discussions.order("updated_at DESC")
      @discussion = current_user.discussions.order("updated_at DESC").first 
      @message = @discussion.messages.new
    else
      @discussion = []
    end


    
    respond_to do |format|
      format.html 
      format.json { render json: @messages }
    end
  end
  
  # GET /messages/1
  # GET /messages/1.json
  def show
   @profile = current_user.profile
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end


  # GET /messages/new
  # GET /messages/new.json
  def new
    @discussions = current_user.discussions.order("updated_at DESC")
    #@discussion = Discussion.find(params[:id])    
    @message = @discussion.messages.new

    if params[:recipient_id].present?
      @recipient = User.find(params[:recipient_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

    def create
  #    if @message.rfp_id.blank?
        @saved_message = current_user.messages.create(params[:message])
   #     @recipient = User.find(@saved_message.recipient_id)
        @messages = @saved_message.discussion.messages

        #Message.where(user_id: [current_user.id, @saved_message.recipient_id], recipient_id: [current_user.id, @saved_message.recipient_id]).order(:id)
         @message = Message.new  
  #    end

   #   if params[:recipient_id].present?
  #      @recipient = User.find_by_id(params[:recipient_id])
  #      @message.recipient_id = params[:recipient_id]
  #    end

      respond_to do |format|
        if @message.save
            format.js
            format.html {redirect_to controller: "messages", action: "new", recipient_id: @saved_message.recipient_id}
        else
          format.html { render action: "new" }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
      # PUT /messages/1
      # PUT /messages/1.json
      def update
        @message = Message.find(params[:id])


        respond_to do |format|
          if @message.update_attributes(params[:message])
            format.html { redirect_to @message, notice: 'Message was successfully updated.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /messages/1
      # DELETE /messages/1.json
      def destroy
        @message = Message.find(params[:id])
        @message.destroy

        respond_to do |format|
          format.html { redirect_to messages_url }
          format.json { head :ok }
        end
      end

       def load_and_check_discussion_recipient
         # initializing model for new and create actions
       #  @discussion = Discussion.new(params[:discussion].presence || {})

         # checking if discussion with this user already exists
      #   if @discussion.recipient_ids && @discussion.recipient_ids.size == 1
           user = User.find(params[:recipient_id])
           @discussion = Discussion.find_between_users(current_user, user)
           if @discussion
             # it exists, let's add message and redirect current user
             @message = @discussion.messages.new
           else
             @discussion = Discussion.create()
             Speaker.create(user_id: current_user.id, discussion_id: @discussion.id )
             Speaker.create(user_id: params[:recipient_id],  discussion_id: @discussion.id )
             @message = @discussion.messages.new
           end
       # end
       end  


    end
          