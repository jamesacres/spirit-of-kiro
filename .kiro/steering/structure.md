# Project Structure

## Root Level Organization

```
├── client/          # Vue.js frontend application
├── server/          # Bun WebSocket server
├── item-images/     # Microservice for AI image generation
├── docs/           # Project documentation
├── scripts/        # Deployment and setup scripts
├── docker/         # Docker volumes and data
├── launch.ts       # Development launcher script
└── docker-compose.yml  # Local development stack
```

## Client Structure (`client/`)

```
├── src/
│   ├── components/     # Vue components for game UI
│   ├── composables/    # Reusable composition functions
│   ├── stores/         # Pinia state management
│   ├── systems/        # Game logic systems
│   ├── utils/          # Utility functions
│   ├── views/          # Route-level components
│   ├── assets/         # Static assets (images, CSS)
│   └── router/         # Vue Router configuration
├── public/             # Public static files
├── iac/               # Infrastructure as Code for deployment
└── package.json       # Dependencies and scripts
```

### Client Systems Architecture

- **focus-system.ts**: UI focus and interaction management
- **game-object-system.ts**: Game object lifecycle and rendering
- **inventory-system.ts**: Item storage and management
- **item-system.ts**: Item properties and behaviors
- **persona-system.ts**: Player character management
- **physics-system.ts**: Movement, collision, and physics
- **preloader-system.ts**: Asset loading and caching
- **socket-system.ts**: WebSocket communication hub

## Server Structure (`server/`)

```
├── handlers/           # WebSocket message handlers
├── state/             # Data persistence layer
├── utils/             # Server utilities
├── llm/               # AI integration and prompts
├── mocks/             # Test data and fixtures
├── iac/               # Infrastructure deployment configs
├── __tests__/         # Test files
└── server.ts          # Main server entry point
```

### Server Message Handlers

Each handler corresponds to a specific client action:

- Authentication: `signin.ts`, `signup.ts`
- Inventory: `list-inventory.ts`, `move-item.ts`
- Items: `pull-item.ts`, `discard-item.ts`, `sell-item.ts`
- Game Actions: `use-skill.ts`, `buy-discarded.ts`, `peek-discarded.ts`
- System: `ping.ts`, `fetch-persona.ts`

## Item Images Service (`item-images/`)

```
├── handlers/          # HTTP request handlers
├── lib/              # Core image generation logic
├── state/            # Redis and vector database integration
├── scripts/          # Utility scripts
├── iac/              # AWS infrastructure configs
└── server.ts         # HTTP server entry point
```

## Documentation (`docs/`)

- **architecture.md**: System design and data flow
- **local-setup.md**: Development environment setup
- **CHALLENGE.md**: Sample tasks and bugs for practice
- **ROADMAP.md**: Future feature ideas
- **server-messages.md**: WebSocket API documentation
- **client-events.md**: Frontend event system docs

## Naming Conventions

- **Components**: PascalCase (e.g., `GameGrid.vue`, `ItemDialog.vue`)
- **Files**: kebab-case for most files (e.g., `game-object-system.ts`)
- **Directories**: kebab-case (e.g., `item-images/`, `__tests__/`)
- **Vue Components**: Single File Components with `<script setup>` syntax
- **Systems**: Suffix with `-system.ts` for game logic modules

## Configuration Files

- **Client**: `vite.config.ts`, `tsconfig.*.json`, `eslint.config.ts`
- **Server**: `config.ts` for environment variables and AWS settings
- **Docker**: `docker-compose.yml` for local development stack
- **Infrastructure**: `iac/` folders contain CloudFormation YAML files
