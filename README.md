# 📚 Book Lending Library Application

## 📑 Table of Contents

- [Introduction](#introduction)
- [Tech Stack](#tech-stack)
- [Requirements](#requirements)
  - [Technologies](#technologies)
  - [Installations](#installations)
- [How to Run the Application](#how-to-run-the-application)
  - [Clone the Repository](#clone-the-repository)
  - [Set Up the Project](#set-up-the-project)
  - [Database Setup](#database-setup)
  - [Run the Server](#run-the-server)
  - [Run Tests](#run-tests)
- [Support](#support)
- [Author](#author)

---

## 📖 Introduction

This is a simple **Book Lending Library Application** built with **Ruby on Rails 8**. It allows registered users to:

- Browse available books 📚
- Borrow books 📝
- Return borrowed books 🔄
- View their currently borrowed books 👀

The system manages books with details such as **title, author, and ISBN**. It also includes a borrowing system with due dates (2 weeks from the borrowing date) and prevents users from borrowing books that are already borrowed.

---

## 🚀 Tech Stack

- **Backend:** Ruby on Rails 8
- **Database:** SQLite/PostgreSQL (depending on environment)
- **Authentication:** Rails 8 default authentication system
- **Testing:**
  - Minitest for unit and integration tests
  - Capybara for system tests
- **Frontend:** Embedded Ruby (ERB) templates

---

## ⚙️ Requirements

### 🖥️ Technologies

- **Ruby:** 3.x or higher
- **Rails:** 8.x
- **Node.js & Yarn:** For JavaScript runtime
- **SQLite:** Database management

### 📦 Installations

1. **Install Ruby:**

   ```bash
   sudo apt install ruby-full # Ubuntu
   ruby -v
   ```

2. **Install Rails:**

   ```bash
   gem install rails
   rails -v
   ```

3. **Install Node.js & Yarn:**

   ```bash
   sudo apt install nodejs yarn
   node -v && yarn -v
   ```

4. **Install Database:**
   - SQLite: Comes bundled with Rails

---

## 🏃‍♂️ How to Run the Application

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Ochiengsteven/library_app.git
cd library_app
```

### 2️⃣ Set Up the Project

```bash
bundle install
```

### 3️⃣ Database Setup

```bash
rails db:create
rails db:migrate
rails db:seed # Seed book data available
```

### 4️⃣ Run the Server

```bash
rails server
```

Visit [http://localhost:3000](http://localhost:3000) 🌐

### 5️⃣ Run Tests

The application uses Rails' built-in testing framework (Minitest) and includes:

#### Test Types

- **Model Tests**: Testing book and borrowing validations and business logic
- **Controller Tests**: Testing book borrowing and returning functionality
- **System Tests**: Testing user interactions with Capybara

#### Running Tests

**Run all tests:**

```bash
rails test
```

**Run specific test types:**

```bash
rails test:models      # Run model tests
rails test:controllers # Run controller tests
rails test:system     # Run system tests
```

---

## 🆘 Support

If you encounter any issues:

- Open an issue on [GitHub](https://github.com/Ochiengsteven/library_app/issues)
- Email: `stevenochieng6305@gmail.com`

---

## 👤 Author

**Your Name**  
GitHub: [@Ochiengsteven](https://www.linkedin.com/in/ochiengotienos/)  
LinkedIn: [Ochieng otieno](https://github.com/Ochiengsteven)

---
