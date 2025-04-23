# UFRB Films

UFRB Films is a video platform designed to showcase short films and TV pilots produced by cinema students at the Federal University of Recôncavo da Bahia (UFRB). This platform allows students to share their creative work with the university community and beyond.

## Features

- **Video Showcase**: Browse all submitted videos on the homepage
- **User Authentication**: Students can create accounts using their institutional email addresses
- **Video Management**: Authenticated users can upload, edit, and manage their video submissions
- **Detailed Project Pages**: Each video includes technical information such as synopsis, cast, crew, etc.
- **Comments System**: Authenticated users can leave comments on videos
- **Responsive Design**: Mobile-friendly interface using Bootstrap

## Requirements

- Ruby 3.4.2
- Rails 8.0.2
- PostgreSQL (recommended for production)
- Node.js and Yarn for asset compilation

## Installation

Clone the repository:

```bash
git clone https://github.com/gabrielfv39/ufrb_shorts/
cd ufrb_shorts
```

Install dependencies:

```bash
bundle install
yarn install
```

Set up the database:

```bash
rails db:create
rails db:migrate
```

## Configuration

Create a `.env` file in the root directory and add the following environment variables:

```
DATABASE_URL=postgresql://localhost/ufrb_shorts_development
RAILS_ENV=development
```

## Running Locally

Start the Rails server:

```bash
rails server
```

Visit `http://localhost:3000` in your browser.

## Testing

Run the test suite:

```bash
rails test
```

## Deployment

The application is configured for deployment on Heroku. To deploy:

1. Create a Heroku account and install the Heroku CLI
2. Create a new Heroku app:
   ```bash
   heroku create ufrb-films
   ```
3. Push code to Heroku:
   ```bash
   git push heroku main
   ```
4. Set up the database:
   ```bash
   heroku run rails db:migrate
   ```

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
