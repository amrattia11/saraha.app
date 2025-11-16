# Anonymous Messaging Platform API

A RESTful API for an anonymous messaging platform built with Express.js and MongoDB.

## Features

- User account management
- Anonymous message posting
- Image upload support (Cloudinary)
- Rate limiting
- Input validation (Joi)
- API documentation (Swagger)
- Security middleware (Helmet, HPP, CORS)

## Tech Stack

- **Runtime:** Node.js (>=18)
- **Framework:** Express.js
- **Database:** MongoDB (Mongoose)
- **Validation:** Joi
- **File Upload:** Multer + Cloudinary
- **Security:** Helmet, HPP, express-mongo-sanitize
- **Documentation:** Swagger UI

## Installation

1. Clone the repository:
```bash
git clone https://github.com/amrattia11/saraha.app.git
cd saraha.app
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory:
```env
PORT=3000
MONGO_URI=mongodb://localhost:27017/anonymous
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
```

4. Start the server:
```bash
npm start
# or for development with auto-reload
npm run dev
```

## API Endpoints

### Health Check
- `GET /health` - Server health check

### Users
- `POST /api/users` - Create a new user account
- `GET /api/users/:username` - Get user public profile

### Messages
- `POST /api/messages/:username` - Send an anonymous message (supports JSON or multipart/form-data with image)
- `GET /api/messages/:username` - List messages for a user (with pagination)
- `DELETE /api/messages/:username/:messageId` - Delete a message (requires x-manage-token header)

## API Documentation

Once the server is running, visit:
- Swagger UI: `http://localhost:3000/docs`

## Postman Collection

Import the Postman collection from `postman/Saraha.postman_collection.json` to test all endpoints.

## Project Structure

```
src/
├── app.js                 # Express app configuration
├── main.js                # Server entry point
├── config/                # Configuration files
│   ├── database.js        # MongoDB connection
│   └── cloudStorage.js    # Cloudinary configuration
├── controllers/           # Route controllers
│   ├── user.controller.js
│   └── message.controller.js
├── models/                # Mongoose models
│   ├── User.js
│   └── Message.js
├── routes/                # API routes
│   ├── user.routes.js
│   ├── message.routes.js
│   └── index.js
├── middlewares/           # Custom middlewares
│   ├── apiLimiter.js
│   ├── messageLimiter.js
│   ├── validation.js
│   ├── fileUpload.js
│   └── errorMiddleware.js
├── utils/                 # Utility functions
│   ├── asyncWrapper.js
│   ├── logUtil.js
│   └── ResponseHelper.js
└── docs/                  # API documentation
    └── openapi.json
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `5000` |
| `MONGO_URI` | MongoDB connection string | `mongodb://localhost:27017/anonymous` |
| `CLOUDINARY_CLOUD_NAME` | Cloudinary cloud name | - |
| `CLOUDINARY_API_KEY` | Cloudinary API key | - |
| `CLOUDINARY_API_SECRET` | Cloudinary API secret | - |
| `CORS_ORIGIN` | CORS allowed origin | `*` |

## License

ISC

