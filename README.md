
# Shoesly

Shoesly is a mobile app for shoes of several brands. Its built with Flutter and Firebase.

## Setup

To get started with Github Explorer, follow these steps:

1. Run the following commands:
   ```bash
   $ make get
   $ make codegen
    ```
2. Run app:
   ```bash
   $ flutter run
    ```

## Structure

Shoesly is structured as follows:

- **Dependency Injection**: Utilizes GetIt & Injectable for managing dependencies.
- **Routing**: Implements auto_route for efficient and structured routing.

This structured approach ensures clarity, scalability, and maintainability throughout the project.

## Screens

Shoesly features the following screens:

- **Auth Screen**: Google or Guest authentication screen.
- **Discovery Screen**: Display a grid list of shoes with infinite scroll and provision for filtering.
- **Orders Screen**: Lists out users orders.
- **Wishlist Screen**: Lists all products the user bookmarked.
- **Filter Screen**: Provides options to filter and sort products.
- **Product Screen**: Provide detailed product information and 'Add to cart' cta.
- **Review Screen**: List all reviews of a product.
- **Cart Screen**: List items in user cart/bag.
- **Checkout Screen**: Information for checkout and payment.

## Services

Shoesly includes the following services:

- **Firebase Service**: Handles all firebase functionalities for authentication and CRUD operations for different collections, stream listeners for real-time updates, and other Firestore-related tasks.
- **Cache Service**: Stores information locally.

## Extras

### Assumptions
Assumptions made:
- Payment and location during checkout doesnt change
- Shipping during checkout is constant
- Using simple state management

### Challenges
1. Implementing efficient filtering and sorting of products from Firestore, especially when dealing with multiple criteria like brands, colors, and price ranges.
*Solution:* I initially faced challenges with Firestore indexes and performance. I moved sorting operations to the client-side and used compound queries to fetch filtered data, ensuring optimal performance and fewer indexes.

2. Ability to track user activities on the app
*Solution:* I decided to setup some form of authentication(Google or Guest) for users.
  
### Additions
Additional features:
- Wishlist: Ability to bookmark a product you like
- Order History: Ability to view history of orders
- Google/Guest mode: Option to register with google acct. or use the app as a guest.


### State Management Approach
In this project, state management is handled using a combination of StreamBuilder widgets and Firebase streams, along with a dedicated Firebase service file to abstract core authentication and Firestore functions. This approach ensures that the UI stays responsive and up-to-date with real-time data changes from Firebase.

#### Using StreamBuilder and Firebase Streams
StreamBuilder: This widget is used extensively to listen to real-time updates from Firebase. It rebuilds the UI whenever new data is emitted by the stream, ensuring that the interface always reflects the current state of the data.
Firebase Streams: Firestore provides real-time data synchronization using streams. By tapping into these streams, the app can automatically update the UI whenever data changes in the Firestore database.
Firebase Service
To keep the codebase organized and maintainable, a dedicated Firebase service file (firebase_service.dart) was created. This service handles core authentication and Firestore operations.

#### Why This Approach?
1. Simplicity: Using StreamBuilder with Firebase streams is straightforward and leverages the reactive programming model provided by Dart and Firebase.
2. Real-Time Updates: This method allows the app to react to real-time data changes efficiently without needing complex state management solutions.
3. Separation of Concerns: By encapsulating Firebase-related logic within a service, the codebase remains clean, modular, and easier to manage.
  


## Some Screenshots

Welcome Page               |  Discovery Page               | Product Page               
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/JustineUgo/shoeapp/blob/master/assets/images/screenshots/Screenshot_20240615-145943.jpg)|![](https://github.com/JustineUgo/shoeapp/blob/master/assets/images/screenshots/Screenshot_20240615-175241.jpg)|![](https://github.com/JustineUgo/shoeapp/blob/master/assets/images/screenshots/Screenshot_20240615-150052.jpg)|


