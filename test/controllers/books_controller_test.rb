require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test "should borrow available book" do
    sign_in @user
    assert @book.available?

    post borrow_book_url(@book)

    assert_redirected_to book_url(@book)
    assert_equal "Book was successfully borrowed.", flash[:notice]
    assert_not @book.reload.available?
  end

  test "should not borrow unavailable book" do
    sign_in @user
    @book.borrowings.create!(user: users(:two), due_date: 2.weeks.from_now)

    post borrow_book_url(@book)

    assert_redirected_to book_url(@book)
    assert_equal "Book is already borrowed.", flash[:alert]
  end

  test "should return borrowed book" do
    sign_in @user
    borrowing = @book.borrowings.create!(user: @user, due_date: 2.weeks.from_now)

    post return_book_url(@book)

    assert_redirected_to book_url(@book)
    assert_equal "Book was successfully returned.", flash[:notice]
    assert borrowing.reload.returned_at.present?
  end

  test "should not return book borrowed by other user" do
    sign_in @user
    @book.borrowings.create!(user: users(:two), due_date: 2.weeks.from_now)

    post return_book_url(@book)

    assert_redirected_to book_url(@book)
    assert_equal "Could not return book.", flash[:alert]
  end
end
