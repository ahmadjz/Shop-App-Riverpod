# Shopping App with Flutter
![logo](https://user-images.githubusercontent.com/46372418/229417976-ff666255-3f3f-4fc5-a143-c8b742529d43.png)

This Shopping App is built using Flutter and allows users to browse products, add items to their cart, and manage their profiles. Users can also access the products page as guests with limited features. The application adheres to principles of Clean Architecture, with Riverpod for state management.

## Project Architecture

The project is inspired by Clean Architecture principles and focuses on the separation of concerns between two primary layers:
- Presentation Layer (UI) - Contains the UI code and its related classes.
- Data Layer - Contains the implementation of data sources, repositories, and models.

Riverpod is used to manage states in the Presentation Layer, effectively separating the UI code from the business logic.


## Libraries
- Riverpod for state management
- Get_it for dependency injection
- Fluro for navigation
- Dio, Freezed, and Retrofit generator for API and data modeling
- Easy_localization for localization
- Flutter_screenutil for responsive UI
- SharedPreferences for local storage
- Lottie for animations

## Main Screens  

1. **Auth Screen**: This screen enables users to log in with their email and password or register. Input validations are performed for email and password, displaying error messages for invalid entries. Once logged in, user information is saved in SharedPreferences, facilitating direct navigation to the Home screen on subsequent app launches. Users can also enter the application as guests with limited features.
2. **Home Screen**: Showcases products with pagination.
3. **Product Details Page**: Presents comprehensive product information and allows users to add products to their cart with a specified quantity.
4. **Cart Modal**: Displays complete cart details, including total price, item count, and all products in the cart. Users can also remove products from the cart as desired.


## Videos
[Mobile Screen](https://drive.google.com/file/d/1sW_l-Mjn6XadHStYziqtICyGbO5lXE3V/view?usp=share_link)

## APK
[apk](https://drive.google.com/file/d/1jnIEpHNBOZN18dDVMspSX9lCdCDq5_D5/view?usp=share_link)

## Flutter Environment Check
Before running the app, ensure that your development environment meets the required dependencies and configurations by running `flutter doctor`. Here's an example screenshot of a `flutter doctor` output:
![Screenshot from 2023-03-21 16-05-30](https://user-images.githubusercontent.com/46372418/226614816-93ac529c-0840-419f-9fe6-2cceb55a2b27.png)

If you encounter any issues or missing dependencies, please refer to the [Flutter documentation](https://flutter.dev/docs/get-started/install) for guidance on setting up your development environment.
