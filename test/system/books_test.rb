require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test "should borrow and return a book" do
    sign_in @user
    visit book_url(@book)

    assert_selector "body", text: "Available"
    click_on "Borrow"

    assert_selector ".notice", text: "Book was successfully borrowed"
    assert_selector "body", text: "Currently borrowed by"

    click_on "Return"

    assert_selector ".notice", text: "Book was successfully returned"
    assert_selector "body", text: "Available"
  end

  test "should show unavailable status for borrowed book" do
    @book.borrowings.create!(user: users(:two), due_date: 2.weeks.from_now)
    sign_in @user

    visit book_url(@book)

    assert_selector "body", text: "Currently borrowed"
    assert_no_selector "a", text: "Borrow"
  end
end
