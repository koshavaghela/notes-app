class NotesController < ApplicationController
	def show
		@note = Note.find(params[:id])
	end

	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def edit
		@note = Note.find(params[:id])
	end

	def create
		#render plain: params[:note].inspect
		@note = Note.new(notes_params)
		if @note.save
			flash[:notice] = "Article was successfully created."
			redirect_to @note
		else
			render 'new'
		end
	end

	def update
		@note = Note.find(params[:id])
		if @note.update(notes_params)
			flash[:notice] = "Note was updated"
			redirect_to note_path(@note)
		else
			flash[:notice] = "Note was not updated"
			render 'edit'
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy 
		flash[:notice] = "Note was deleted"
		redirect_to notes_path
	end

	private

	def notes_params
		params.require(:note).permit(:title, :body)
	end
end
