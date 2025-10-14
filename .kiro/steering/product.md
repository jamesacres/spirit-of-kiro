# Product Overview

Spirit of Kiro is an infinite crafting workshop game that demonstrates
AI-powered game development. The game features:

## Core Gameplay

- **Infinite Item Generation**: Every item is unique with AI-generated
  descriptions, damage values, and quirks
- **Dynamic Crafting System**: Transform, combine, and modify items using
  realistic verbs and actions
- **Item Appraisal**: AI-powered valuation system for selling crafted items
- **Physics-Based Interactions**: Realistic movement, collision, and object
  manipulation

## Key Features

- Real-time multiplayer via WebSocket connections
- Procedural item generation using AWS Bedrock (Nova Pro, Claude Sonnet)
- Unique item images generated with Amazon Nova Canvas
- User authentication via Amazon Cognito
- Persistent game state with DynamoDB storage

## Target Audience

This is a demo project showcasing best practices for AI-assisted development
with Kiro. Over 95% of the codebase was generated through AI prompting, serving
as a reference implementation for AI engineering patterns.

## Game Objects

- **Dispenser**: Generates new random items
- **Workbench**: Crafting and item modification station
- **Storage Chest**: Inventory management
- **Computer**: Item analysis and information
- **Garbage**: Item disposal
- **Appraiser**: Item selling and valuation
