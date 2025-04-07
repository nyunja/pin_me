# Pin Me

A modern Ruby on Rails application using Inertia.js, React, and Vite.

## Technology Stack

- Ruby on Rails 7.x
- React 19.x via Inertia.js
- Vite for asset bundling
- TailwindCSS for styling
- Devise for authentication
- Docker for containerization
- Kamal for deployment

## Prerequisites

- Ruby 3.4.2
- Node.js 20.x or newer
- PostgreSQL (or your configured database)
- Docker (for production deployment)

## Development Setup

1. Clone the repository
   ```bash
   git clone <repository-url>
   cd pin_me
   ```

2. Install dependencies
   ```bash
   bin/setup
   ```

3. Start the development server
   ```bash
   bin/dev
   ```

The application will be available at http://localhost:3000

## Testing

Run the test suite:
```bash
bin/rails test
bin/rails test:system
```

## Security Checks

Check for security vulnerabilities:
```bash
bin/brakeman --no-pager
```

## Linting

Run the linter:
```bash
bin/rubocop
```

## Deployment

This application uses Kamal for deployment. Make sure you have:

1. Docker registry credentials
2. Server SSH access
3. Required environment variables in `.kamal/secrets`

Deploy to production:
```bash
bin/kamal deploy
```

Common deployment commands:
- `bin/kamal lock` - Prevent deployments
- `bin/kamal unlock` - Allow deployments
- `bin/kamal rollback` - Revert to previous version
- `bin/kamal app exec rails console` - Launch Rails console
- `bin/kamal logs -f` - Tail logs

## Environment Variables

Required environment variables:
- `RAILS_MASTER_KEY` - Rails credentials master key
- `KAMAL_REGISTRY_PASSWORD` - Docker registry password

## Architecture

- `app/frontend/` - React components and Inertia pages
- `app/controllers/` - Rails controllers including Devise customizations
- `config/deploy.yml` - Kamal deployment configuration

## Authentication

Authentication is handled by Devise with custom controllers for Inertia.js integration:

- `app/controllers/users/sessions_controller.rb` - Handles sign in
- `app/controllers/users/registrations_controller.rb` - Handles registration
- `app/controllers/concerns/inertia_csrf.rb` - CSRF protection for Inertia

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -am 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details
