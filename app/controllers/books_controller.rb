class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # I'm adding the create and update methods which can later be used later by other roles(admin/superadmin)
  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def borrow
    Rails.logger.debug "Attempting to borrow book #{@book.id}"
    if @book.available?
      borrowing = current_user.borrowings.build(book: @book, due_date: 2.weeks.from_now)
      Rails.logger.debug "Created borrowing: #{borrowing.inspect}"
      if borrowing.save
        Rails.logger.debug "Borrowing saved successfully"
        redirect_to @book, notice: 'Book was successfully borrowed.'
      else
        Rails.logger.debug "Borrowing failed to save: #{borrowing.errors.full_messages}"
        redirect_to @book, alert: 'Could not borrow book.'
      end
    else
      Rails.logger.debug "Book is not available"
      redirect_to @book, alert: 'Book is already borrowed.'
    end
  end

  def return
    borrowing = @book.current_borrowing
    if borrowing&.user == current_user
      borrowing.update(returned_at: Time.current)
      redirect_to @book, notice: 'Book was successfully returned.'
    else
      redirect_to @book, alert: 'Could not return book.'
    end
  end

  private
    # callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn)
    end
end
