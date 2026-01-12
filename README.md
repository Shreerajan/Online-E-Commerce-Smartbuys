# Online Ecommerce Application (JSP + Servlets + JDBC)

## Project Description
The Online Ecommerce Application is a functional web-based shopping platform built using core Java technologies such as JSP, Servlets, and JDBC. 
The project demonstrates important concepts like user registration, login, session management, product listing, and database connectivity. 
It follows an MVC-like approach—JSP for UI, Servlets for logic, and JDBC for data management—making it ideal for beginners who want to understand Java web application development without frameworks.

## Demo Video

![Product Demo ](images/homepage.png)
![Product Demo ](images/sessionlogout.png)
![Product Demo ](images/sessionlogout1.png)

## Installation

### Software Requirements
- **JDK 17 or above**
- **Apache Tomcat 9**
- **Eclipse IDE (Enterprise Edition)**
- **MySQL Server**
- **MySQL Connector/J (JDBC Driver)**

### Project Setup
1. Create a new **Dynamic Web Project** in Eclipse.
2. Set **Apache Tomcat v9.0** as the Target Runtime.
3. Add the MySQL connector JAR into:  
   `src/main/webapp/WEB-INF/lib/`
4. Create MySQL database:
   ```sql
   CREATE DATABASE online_ecommerce;
   ```
5. Create required tables (`users`, `products`).

   ```sql
   -- User table
   CREATE TABLE users(
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(100),
   email VARCHAR(100) UNIQUE,
   password VARCHAR(255),
   role VARCHAR(20) DEFAULT 'USER'
   );
   -- Product table
   CREATE TABLE products(
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(100),
   price DOUBLE,
   description TEXT
   );

   -- Orders main table
   CREATE TABLE orders (
   id          INT PRIMARY KEY AUTO_INCREMENT,
   user_id     INT NOT NULL,
   total_amount DOUBLE NOT NULL,
   status      VARCHAR(20) NOT NULL,
   created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES users(id)
   );

   -- Order items
   CREATE TABLE order_items (
   id         INT PRIMARY KEY AUTO_INCREMENT,
   order_id   INT NOT NULL,
   product_id INT NOT NULL,
   quantity   INT NOT NULL,
   price      DOUBLE NOT NULL,
   FOREIGN KEY (order_id) REFERENCES orders(id),
   FOREIGN KEY (product_id) REFERENCES products(id)
   );
   ```

6. Insert dummy products into product table.

   ```sql
   INSERT INTO products(name, price, description) VALUES
   ('Laptop', 55000, 'Basic student laptop'),
   ('Headphones', 1500, 'Wireless headphones'),
   ('Keyboard', 800, 'Mechanical keyboard');

   ALTER TABLE products ADD image VARCHAR(255);

   ````
7. Update your DBConnection.java with MySQL username & password.
8. Verify servlet mappings inside:  
   `src/main/webapp/WEB-INF/web.xml`

## Execution Steps
1. Start **MySQL server**.
2. Start **Apache Tomcat** from Eclipse (Servers tab → Start).
3. Deploy the project:  
   `Right-click project → Run As → Run on Server`
4. Open in browser:  
   `http://localhost:8080/OnlineEcommerceApp/`
5. Access login, register, dashboard, and product pages as needed.

---

# 🏗 System Architecture  
![System Architecture](demo/Online_Ecommerce_demo_video (1).mp4)

---

# 🗄 ER Diagram  
![ER Diagram](images/er_diagram.png)

---

# 🏛 Class Diagram  
![Class Diagram](images/class_diagram.png)

---

# 📊 Use-Case Diagram  
![Use Case Diagram](images/usecase_diagram.png)

---

# 🔌 JDBC Workflow
![JDBC Workflow Diagram](images/jdbc_workflow.png)
---

# 📁 Project Folder Structure

```
OnlineEcommerceApp/
│
├── README.md
├── .gitignore
├── pom.xml (if using Maven)
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/ecommerce/
│   │   │       ├── controller/
│   │   │       ├── dao/
│   │   │       ├── model/
│   │   │       └── util/
│   │   └── webapp/
│   │       ├── index.jsp
│   │       ├── login.jsp
│   │       ├── register.jsp
│   │       ├── products.jsp
│   │       ├── dashboard.jsp
│   │       ├── cart.jsp
│   │       ├── header.jsp
│   │       └── WEB-INF/
│   │           ├── web.xml
│   │           └── lib/
│   └── test/
│
└── images/
```

---

# 🔄 Sequence

## 🔑 Login Sequence

    actor User
    User ->> LoginServlet: Submit Login Form
    LoginServlet ->> UserDAO: validateUser()
    UserDAO ->> DBConnection: getConnection()
    DBConnection -->> UserDAO: Connection
    UserDAO ->> Database: SELECT * FROM users
    Database -->> UserDAO: User Data
    UserDAO -->> LoginServlet: User Object
    LoginServlet ->> Session: set user
    LoginServlet -->> User: Redirect Dashboard

## 📝 Registration Sequence

    actor User
    User ->> RegisterServlet: Submit Registration Form
    RegisterServlet ->> UserDAO: registerUser()
    UserDAO ->> DBConnection: getConnection()
    DBConnection -->> UserDAO: Connection
    UserDAO ->> Database: INSERT user data
    Database -->> UserDAO: Success
    UserDAO -->> RegisterServlet: OK
    RegisterServlet -->> User: Redirect Login Page


=======
# 📦 Online E-Commerce Platform – SmartBuys

An online marketplace enabling buyers, sellers, and admins to interact seamlessly for smooth digital shopping and business management.
This platform provides a complete workflow including product listing, online shopping, and real-time order tracking.


Presentation - Online E-Commerc…

# 🚀 Current Features
# 👤 Admin Panel

Manage products, and orders centrally

Maintain smooth marketplace operations

Monitor platform activity efficiently


# 🛍️ Product Dashboard
hasing password techniques using SHA256
Session based timer counter with autologout.
Product listings With price
Search, sort filter, pagination
Add to cart button
Cart page and place order
Order listing page with pending/approved order status



# 🛒 Buyer Experience

Browse a wide range of products

Add a product from dashboard

User-friendly interface for smooth navigation


# 📊 Why E-Commerce?

300M+ online shoppers worldwide

70% growth in digital sales

90% customers prefer online shopping


Presentation - Online E-Commerc…

The rise of digital platforms has transformed modern shopping, providing convenience, global reach, and business opportunities for all stakeholders.

# 🧩 System Architecture

Clear interaction flows between users and backend services

Supports structured data processing across dashboard roles


Presentation - Online E-Commerc…

# 👥 User Types
User Type	Role
Admin	Platform management and oversight
Seller Product management and handling
Buyer	Product browsing and purchasing

All users work together to create a smooth and efficient digital shopping system.


# 🧠 Team – The Hivers

Shree Rajan (Team Leader)

Suhana Kumari

Aashish Kishor

# 📌 Future Enhancements

Payment gateway integration

AI Powered Product recommend
