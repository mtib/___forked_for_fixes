# Docker Setup

This guide explains how to run the AI Language Tutor using Docker.

## Prerequisites

- Docker and Docker Compose installed
- OpenAI API key

## Quick Start

1. **Set up environment variables:**
   ```bash
   # Copy the example file
   cp .env.example .env

   # Edit .env and add your OpenAI API key
   nano .env
   ```

2. **Configure the learning language (optional):**
   Edit `utils/config.json` to set your target language:
   ```json
   {
     "openai_model_name": "gpt-4o",
     "temperature": 0.7,
     "language": "Polish"
   }
   ```

3. **Build and run:**
   ```bash
   docker-compose up -d
   ```

4. **Access the app:**
   Open your browser to `http://localhost:8501`

## Docker Commands

```bash
# Start the application
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the application
docker-compose down

# Rebuild after code changes
docker-compose up -d --build

# Remove everything including volumes
docker-compose down -v
```

## Data Persistence

User data is stored in the `assets/` directory, which is mounted as a volume. This ensures your vocabulary, lesson plans, and chat history persist between container restarts.

The following files are persisted:
- `assets/user_vocabulary.json` - Your vocabulary list
- `assets/lesson_plan.json` - Your lesson plans
- `assets/lesson_plan_inputs.json` - Lesson plan settings
- `assets/chat_history.json` - Conversation history

## Configuration Changes

The `utils/config.json` file is also mounted as a volume, so you can change the language or model settings without rebuilding the container:

```bash
# Edit the config
nano utils/config.json

# Restart to apply changes
docker-compose restart
```

## Troubleshooting

**Port already in use:**
If port 8501 is already in use, edit `docker-compose.yml` and change the port mapping:
```yaml
ports:
  - "8502:8501"  # Access via localhost:8502
```

**API key not working:**
Verify your `.env` file contains a valid OpenAI API key:
```bash
cat .env
```

**Reset all data:**
To start fresh, remove the assets directory contents:
```bash
rm assets/*.json
docker-compose restart
```
