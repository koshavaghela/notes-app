class NotesController < ApplicationController
	before_action :set_note, only: [:edit, :update, :show, :destroy]
	
	def show
	end

	def index
		@notes = current_user.notes.paginate(page: params[:page], per_page: 5)
	end

	def new
		@note = Note.new
		@note.user = current_user
	end

	def edit
	end

	def create
		#render plain: params[:note].inspect
		@note = Note.new(notes_params)
		@note.user = current_user
		if @note.save
			flash[:notice] = "Article was successfully created."
			redirect_to @note
		else
			render 'new'
		end
	end

	def update
		if @note.update(notes_params)
			flash[:notice] = "Note was updated"
			redirect_to note_path(@note)
		else
			flash[:notice] = "Note was not updated"
			render 'edit'
		end
	end

	def destroy
		@note.destroy 
		flash[:notice] = "Note was deleted"
		redirect_to notes_path
	end

	private

	def notes_params
		params.require(:note).permit(:title, :body, category_ids: [])
	end

	def set_note
		@note = Note.find(params[:id])
	end
end
