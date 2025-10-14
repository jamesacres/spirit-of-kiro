# Technology Stack

## Runtime & Build Tools

- **Bun**: Primary JavaScript runtime for all components
- **Vite**: Frontend build tool and development server
- **Docker/Podman**: Containerization for local development
- **TypeScript**: Primary language across all components

## Frontend (Client)

- **Vue.js 3**: Frontend framework with Composition API
- **Pinia**: State management
- **Vue Router**: Client-side routing
- **Vite**: Build tool and dev server
- **ESLint + Prettier**: Code formatting and linting

## Backend (Server)

- **Bun**: WebSocket server runtime
- **WebSocket (ws)**: Real-time client-server communication
- **AWS SDK**: Integration with AWS services
- **Sharp**: Image processing

## Infrastructure & Services

- **AWS Bedrock**: AI model integration (Nova Pro, Claude Sonnet, Titan
  Embeddings, Nova Canvas)
- **Amazon Cognito**: User authentication
- **DynamoDB**: Game state persistence
- **S3 + CloudFront**: Asset storage and distribution
- **Redis/MemoryDB**: Caching and vector storage

## Development Commands

### Root Level

```bash
# Start both client and server in development mode
bun dev

# Install dependencies (run in root, client/, and server/)
bun install
```

### Client Development

```bash
cd client
bun run dev          # Start development server
bun run build        # Production build
bun run type-check   # TypeScript checking
bun run lint         # ESLint with auto-fix
bun run format       # Prettier formatting
bun run test:unit    # Run unit tests
```

### Server Development

```bash
cd server
bun --watch server.ts    # Development with hot reload
bun run test            # Run tests with JUnit output
bun run bootstrap-dynamodb  # Setup local DynamoDB tables
```

### Docker Development

```bash
# Full stack with containers
podman compose build && podman compose up --watch --remove-orphans --timeout 0 --force-recreate

# Bootstrap DynamoDB in container
podman exec server bun run /app/bootstrap-local-dynamodb.js
```

## Project Structure Conventions

- Use TypeScript throughout
- Vue Composition API pattern
- System-based architecture for game logic
- Event-driven communication between systems
- WebSocket message handlers for server logic
