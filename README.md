# News App

A simple and modern news application built with Swift using **MVVM architecture**. The app fetches the latest news from the **News API** and allows users to view full articles in an in-app WebView.

## Features

- **News Categories:**
  - Switch between "Business News" and "Apple News" using the tab bar.
- **In-App WebView:**
  - Tap on an article to open the full content in an integrated WebView.
- **Modern UI:**
  - Gradient backgrounds, rounded cards, and clean layouts using **SnapKit**.

## Libraries Used

- **[Alamofire](https://github.com/Alamofire/Alamofire):** For networking and API requests.
- **[SnapKit](https://github.com/SnapKit/SnapKit):** For layout constraints.

## Installation

### Prerequisites
- Xcode 13 or later
- CocoaPods installed

### Endpoints Used:

1. Business News: https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=YOUR_API_KEY
2. Apple News: https://newsapi.org/v2/everything?q=apple&from=2024-11-22&to=2024-11-22&sortBy=popularity&apiKey=YOUR_API_KEY
