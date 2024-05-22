# TradeMaster

A Comprehensive Trading App for Multiple Cryptocurrencies

## Overview
TradeMaster is a powerful mobile application designed to provide users with real-time market data, customizable watchlists, advanced charting tools, portfolio management, news updates, and robust security features. Developed as part of the CIS651 Mobile Application Programming course at Syracuse University, TradeMaster aims to democratize access to the financial markets and empower both novice and experienced traders.

## Introduction
In the fast-paced world of finance, informed decisions can significantly impact investment portfolios. TradeMaster provides a comprehensive solution for traders and investors, offering an ecosystem that supports users at every stage of their trading journey. With an intuitive interface, real-time data, and advanced features, TradeMaster empowers users to navigate the financial markets with confidence.

## Link to Download App icon 
https://www.appicon.co/#:~:text=App%20Icon%20Generator,You%20can%20now%20download

## Features and Functionality
- **Real-time Market Data**: Access up-to-date information on stocks, bonds, and cryptocurrencies.
- **Customizable Watchlists**: Track favorite assets with personalized watchlists.
- **Advanced Charting**: Analyze historical price data and trends with sophisticated charting tools.
- **Portfolio Management**: Manage and analyze investment portfolios with ease.
- **News and Alerts**: Stay informed with real-time news and alerts related to portfolio and market trends.
- **Risk Management**: Assess and manage portfolio risk to mitigate potential losses.
- **Security and Privacy**: Ensure data security with robust measures to protect sensitive information.

## Technical Features
- **Google Firebase**: Utilized for real-time database management, authentication, and storage.
- **Real-time Database**: Store and sync data in real-time.
- **Authentication**: Manage user accounts with various authentication methods.
- **Storage**: Securely store and serve user-generated content.

## API Links
- **CoinGecko API**: [CoinGecko API](https://www.coingecko.com/en/api) - Retrieve cryptocurrency data such as prices, market cap, and historical data.
- **News API**: [News API](https://newsapi.org/) - Fetch news articles related to cryptocurrencies to keep users informed about the market.

## Services
- **AuthenticationManager.swift**: Manages user authentication, including sign-in, sign-out, and registration.
- **CoinDataService.swift**: Fetches and manages coin data from CoinGecko API.
- **CoinDetailDataService.swift**: Retrieves detailed information about specific coins.
- **MarketDataService.swift**: Manages global market data.
- **NewsDownloadManager.swift**: Downloads and manages business news articles.

## Models
- **News.swift**: Models news articles with properties like title, URL, and image URL.
- **Card.swift**: Models a payment card with properties for card number, name, expiration date, and CVV.
- **GoogleSignInResultModel.swift**: Represents the result of Google Sign-In with ID and access tokens.
- **CoinDetailModel.swift**: Detailed information about a specific coin.
- **CoinModel.swift**: Detailed information about cryptocurrencies, including price data and market statistics.
- **MarketDataModel.swift**: Global market data with properties for market cap, volume, and BTC dominance.
- **StatisticModel.swift**: Represents a data statistic with title, value, and percentage change.

## Views
- **AccountVerificationView.swift**: Handles account verification functionality.
- **AddingCard.swift**: View for adding a payment card.
- **CardInfo.swift**: Displays card information.
- **ChartView.swift**: Displays financial data charts.

## Future Scope
TradeMaster aims to continually evolve by integrating more advanced features such as:
- Enhanced analytics and AI-driven trading recommendations.
- Expanded asset classes including stocks and commodities.
- Integration with additional financial news sources and social trading features.

## Conclusion
TradeMaster sets a new standard in trading applications by combining accessibility, innovation, and empowerment. Whether you are a novice investor or a seasoned trader, TradeMaster offers the tools and features necessary to succeed in the dynamic world of financial markets.

---

This project was developed by Aishwarya Girish Mensinkai as part of the CIS651 Mobile Application Programming course at Syracuse University.
