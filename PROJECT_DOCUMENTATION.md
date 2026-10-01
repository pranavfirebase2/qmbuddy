# QMBUDDY (Quick Menu Buddy) - Project Documentation

## 1. Project Overview
QMBUDDY is a QR-code-based digital menu and ordering system for restaurants and shops. It eliminates the need for customers to wait for waiters by allowing them to scan a QR code, view the menu, and place orders directly from their smartphones.

## 2. Core Concept
- **Customers (Users):** Visit the shop, scan the QR code placed on the table, view the digital menu, and place an order.
- **Shop Owners:** Manage the shop, menu, and staff. Receive and manage orders.
- **Staff (Waiters/Kitchen):** Receive orders from customers. Waiters can manage table service, and kitchen staff can manage food preparation status.

## 3. User Roles & Modules

### 3.1 Super Admin (Platform Owner)
- Manages the entire platform via a separate dashboard.
- **Shop Approval:** Onboards new shops. When a shop registers, their account is inactive (`isApproved: false`) until reviewed and approved by the Super Admin.
- Manages subscription/billing for shops.
- Platform-level analytics and overall control.

### 3.2 Shop / Restaurant Owner
- Dashboard to manage their specific shop.
- **Menu Management:** Add/Edit/Delete food items organized by Categories (e.g., Starters, Main Course, Drinks).
- **Staff Management:** Add staff members and assign roles (Waiter, Kitchen Team, etc.).
- **QR Code Generation:** Generate QR codes for different tables.
- **Order Management:** View all incoming orders, track their status, and monitor daily revenue.

### 3.3 Staff (Waiters & Kitchen Team)
- **Waiters (Captain App):** Receive notifications for new orders. **Direct Ordering:** Waiters can manually select a table in the app (or scan the table's QR from within the app) and place an order on behalf of the customer. The order goes directly to the kitchen.
  - *Conflict Prevention (Order Merging):* If a waiter places an order for a table that already has an active order (e.g., customer ordered via their phone and then asks the waiter for an extra item), the system will automatically append the new items to the existing active order rather than creating a duplicate bill.
- **Kitchen Team (KDS):** When staff with the 'Kitchen' role logs in, they see a Kitchen Display System (KDS) UI. They receive real-time order tickets. Once food is prepared, they click **'Ready to Serve'**, which automatically updates the database and sends a push notification to both the Customer and the Waiter.

### 3.4 Users (Customers)
- **App & Web Support:** Users can use a dedicated QMBUDDY Mobile App or a Web interface.
- **Home Dashboard:** The main screen of the app/web will display location-based combo offers from various shops, a search bar, and a QR Scanner.
- **Shop Menu Access:** Users can reach a specific shop's menu by either scanning their QR code or searching for the shop.
- **Web URL Structure:** When scanning the QR code, the web URL will follow the format: `domain.com/{shop_unique_id}`.
- **Order Tracking & Continuous Ordering:** Customers have a dedicated "My Orders" section to view active order status. If they want more food while their current order is active (e.g., ordering dessert after the main course), they can simply browse the menu and click "Order" again. The system will seamlessly **Add-on / Append** the new items to their existing active bill, preventing multiple separate bills for the same table.

## 4. UI/UX & Clarified Requirements
- **Customer Menu Interface (KFC Style):** The menu UI will feature a very modern, premium, yet **extremely simple and clean** dual-pane layout. It will only show exactly what the user needs, with zero unwanted clutter.
  - **Left Sidebar:** Menu Categories (e.g., Offers, Starters, Main Course).
  - **Right Main Area:** Products/Dishes corresponding to the selected category.
  - **Bottom Bar:** A persistent 'Cart/Basket' section to view selected items and place the order.
  
### 4.1 Key Smart Features
- **Hyperlocal Marketing & Discovery:** The Customer App's home dashboard will use the user's location to display nearby cafes and restaurants. Shop owners can publish exclusive "Combo Offers" to this main dashboard to attract new customers. This turns the app into a powerful marketing tool for the shops.
- **Time-Based Category Auto-Sort:** The left sidebar categories will automatically sort based on the current time of day. For example, if a customer scans the QR code at 8:00 AM, the "Breakfast" or "Morning Specials" category will automatically jump to the top. This significantly improves the user experience.
- **Push Notification System (FCM):** An automated notification system using Firebase Cloud Messaging. 
  - *Order Placed:* Notifies Shop Owner and assigned Staff.
  - *Order Status Updated:* Notifies the User when food is Preparing/Ready.
  - *System Broadcasts:* Super Admin can send targeted push notifications separately to Users (e.g., offers) or to Shop Owners (e.g., updates).
  - *Shop Marketing:* Shop owners can notify their previous customers about new offers.
- **Dynamic QR & Table Management:** Shop owners can generate and download PDF QR codes for all their tables instantly. They can customize table names (e.g., "VIP 1", "Balcony") and can temporarily deactivate a table's QR code if it is damaged or being misused.

### 4.2 Other Requirements
- **User Authentication (Cost-Effective):** Instead of using expensive SMS OTP logins, customers will log in using **Google Authentication**. This is free, fast, and we can automatically fetch the user's Name and Email. No extra typing required for the user.
- **Dynamic Content:** All categories, products, and images shown in this interface are dynamically added and managed by the respective Shop Owner.
- **Payment Method:** For the initial version, payment will be handled offline (at the counter or to the waiter). Online payment via the customer's phone is planned for a **future** update.

## 5. Tech Stack & Platform Details (MVP Phase)
- **Frontend (App & Web):** **Flutter** will be used for both the Mobile App (Android/iOS) and the Web platform (Flutter Web). This single-codebase approach speeds up MVP development and ensures the premium KFC-style UI is exactly the same across all devices.
- **Backend & Database:** **Firebase** will be used for Authentication, Database (Firestore), Storage, and Hosting. This integrates perfectly with Flutter for rapid MVP development.

## 6. App Architecture & State Management
- **Architecture:** We will follow **Clean Architecture**. This ensures the codebase is scalable, testable, and maintainable by separating the UI, Domain (business logic), and Data layers.
- **State Management:** **Riverpod** will be used for robust, safe, and efficient state management.
- **Data Classes:** **Freezed** will be used for generating immutable data classes and JSON serialization.

## 7. Project Setup & Deployment
### 7.1 Environments (Flavors)
The project will be built using two flavors to separate testing data from real data:
- **Dev (Development):** Used for testing and building new features. Connects to a Dev Firebase project.
- **Prod (Production):** The live app used by real customers and shop owners. Connects to the Prod Firebase project.

### 7.2 Entry Points (main.dart)
To optimize the app/web bundle size and keep the logic clean, we will use separate entry points for Customers, Shops, and Super Admin. 

**1. Unified App (Customers & Shop Owners):**
To keep development and maintenance as simple as possible, we will use a **Completely Unified App** for both Customers and Shops (Mobile and Web). 
- `main_dev.dart` (Development)
- `main_prod.dart` (Production)

*Routing & Deep Linking:*
- **App/Web Default:** Opens to the Customer Dashboard. Features a "Merchant Login" button for Shop Owners.
- **QR Code Scan (Web):** When a user scans a QR code, the URL will be formatted as `domain.com/menu/{shopId}/{tableId}`. The Flutter routing (GoRouter) will automatically bypass the home screen, take the user directly to the **User Menu Panel** for that specific shop, and securely store the `tableId` for the final order.

**2. Super Admin Panel (Platform Owner):**
For security and bundle size optimization, the Super Admin dashboard will be a completely separate app/entry point with its own flavors.
- `main_superadmin_dev.dart`
- `main_superadmin_prod.dart`

## 8. Database Architecture (Firestore)
The database architecture, collections, and Entity-Relationship (ER) diagram have been documented in a separate file.
Please see: [`DATABASE_DESIGN.md`](./DATABASE_DESIGN.md)
