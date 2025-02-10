require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
  end

  test "should be valid with all attributes" do
    assert @book.valid?
  end

  test "should require title" do
    @book.title = nil
    refute @book.valid?
  end

  test "should require author" do
    @book.author = nil
    refute @book.valid?
  end

  test "should require isbn" do
    @book.isbn = nil
    refute @book.valid?
  end

  test "available? should return true when not borrowed" do
    assert @book.available?
  end

  test "available? should return false when borrowed" do
    @book.borrowings.create!(user: users(:one), due_date: 2.weeks.from_now)
    refute @book.available?
  end

  test "current_borrowing should return nil when not borrowed" do
    assert_nil @book.current_borrowing
  end

  test "current_borrowing should return active borrowing" do
    borrowing = @book.borrowings.create!(user: users(:one), due_date: 2.weeks.from_now)
    assert_equal borrowing, @book.current_borrowing
  end
end
